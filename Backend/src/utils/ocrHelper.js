const vision = require('@google-cloud/vision');
const cache = require('./cache');

// Create a client
const client = new vision.ImageAnnotatorClient({
  keyFilename: process.env.GOOGLE_CLOUD_VISION_CREDS
});

exports.convertImageToText = async (imageBuffer) => {
  try {
    // Check cache first
    const hash = require('crypto').createHash('md5').update(imageBuffer).digest('hex');
    const cacheKey = `ocr:${hash}`;
    const cachedResult = cache.get(cacheKey);
    if (cachedResult) return cachedResult;

    // Perform text detection
    const [result] = await client.documentTextDetection(imageBuffer);
    const fullTextAnnotation = result.fullTextAnnotation;

    if (!fullTextAnnotation) {
      throw new Error('No text detected in image');
    }

    const ocrResult = {
      text: fullTextAnnotation.text,
      confidence: result.textAnnotations[0].confidence,
      language: result.textAnnotations[0].locale || 'en'
    };

    // Cache the result
    cache.set(cacheKey, ocrResult, 86400000); // Cache for 24 hours

    return ocrResult;
  } catch (error) {
    console.error('Google Vision OCR Error:', error);
    throw error;
  }
};
