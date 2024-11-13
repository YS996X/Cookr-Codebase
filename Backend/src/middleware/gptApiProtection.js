const rateLimit = require('express-rate-limit');
const cache = require('../utils/cache');
const { sendEmergencyReport } = require('../utils/reportingHelper');

// Content sanitization and validation
function sanitizePrompt(prompt) {
  return prompt
    .replace(/[<>]/g, '') // Remove potential HTML/XML tags
    .replace(/[^\w\s.,?!-]/g, '') // Allow only basic punctuation
    .trim();
}

function isAbusiveRequest(prompt) {
  const lowercasePrompt = prompt.toLowerCase();
  const abusiveKeywords = [
    'hack', 'exploit', 'vulnerability', 'illegal', 'password',
    'credit card', 'ssn', 'social security', 'private key',
    'database', 'token', 'secret', 'credentials'
  ];
  return abusiveKeywords.some(keyword => lowercasePrompt.includes(keyword));
}

// Rate limiter for GPT API calls
const gptLimiter = rateLimit({
  windowMs: 60 * 60 * 1000, // 1 hour window
  max: 50, // limit each user to 50 requests per hour
  keyGenerator: (req) => req.user.id, // Rate limit by user ID instead of IP
  handler: (req, res) => {
    sendEmergencyReport('RATE_LIMIT', `User ${req.user.id} exceeded GPT rate limit`, 'gptApiProtection.js', '');
    res.status(429).json({ message: 'Too many questions generated. Please try again later.' });
  }
});

// Content validation middleware
const validateContent = (req, res, next) => {
  const { notes } = req.body;
  
  if (!notes || notes.length < 10) {
    return res.status(400).json({ message: 'Content too short for question generation' });
  }

  if (notes.length > 5000) {
    return res.status(400).json({ message: 'Content too long. Please break into smaller sections' });
  }

  if (isAbusiveRequest(notes)) {
    sendEmergencyReport('ABUSIVE_REQUEST', `User ${req.user.id} attempted to send abusive content`, 'gptApiProtection.js', '');
    return res.status(403).json({ message: 'Content contains prohibited keywords' });
  }

  req.body.notes = sanitizePrompt(notes);
  next();
};

// Cache middleware for GPT responses
const gptCache = (req, res, next) => {
  const cacheKey = `gpt:${req.body.notes}:${req.body.previousQuestionNum}`;
  const cachedResponse = cache.get(cacheKey);

  if (cachedResponse) {
    return res.json(cachedResponse);
  }

  res.originalJson = res.json;
  res.json = (body) => {
    cache.set(cacheKey, body, 3600000); // Cache for 1 hour
    res.originalJson(body);
  };

  next();
};

module.exports = {
  gptLimiter,
  validateContent,
  gptCache,
  sanitizePrompt,
  isAbusiveRequest
};
