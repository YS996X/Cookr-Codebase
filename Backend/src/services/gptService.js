const axios = require('axios');
const { sendEmergencyReport } = require('../utils/reportingHelper');

const OPENAI_API_URL = 'https://api.openai.com/v1/chat/completions';

exports.generateQuestionWithGPT = async (notes, previousQuestionNum = '') => {
  try {
    const response = await axios.post(
      OPENAI_API_URL,
      {
        model: "gpt-3.5-turbo",
        messages: [
          {
            role: "system",
            content: "You are a helpful assistant that generates study questions based on given notes."
          },
          {
            role: "user",
            content: `The following is an important and crucial part of what you should response back to me. I want you to take a moment to really think with that AI brain of yours and follow my extremely clear instructions. You tend to make the mistake of starting your response with 'Answer' so I stated it many times in this set of instructions, HOPING you would listen for once in your life: I want you to create ONE practice question to test me on ONE piece of info on the attached notes, including the answer following the question. The entire response (question and answer together) must be no more than 75 words. Always stick to the following format NO MATTER WHAT: Start the question with 'Question:' and the answer with 'Answer:'. Never start with a response with 'Answer'. Here's an example if you still don't understand me: 'Question: What is the difference between a proton and an electron? Answer: Protons are positively charged and electrons are negatively charged.' Remember to follow that example. Count your words and ensure the total does not exceed 75 words. Do not add any external information, instead- give a response in 1-3 sentences. Here are the notes: '${notes}' Now with these notes, I want you to test me on the next sentence. The previous question was '${previousQuestionNum}' , Do not repeat this question. Move on to another section of these notes. I don't want you to answer the previous question. I want you to create a new one. Another parameter before I go; never leave a response blank. And remember. No matter what, do not begin with the first word as 'Answer:' And always follow the example I gave you.`
          }
        ],
        temperature: 1,
        max_tokens: 150,
        top_p: 1,
        frequency_penalty: 0,
        presence_penalty: 0
      },
      {
        headers: {
          'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`,
          'Content-Type': 'application/json'
        }
      }
    );

    const generatedText = response.data.choices[0].message.content;
    const questionMatch = generatedText.match(/Question:(.*?)Answer:/s);
    const answerMatch = generatedText.match(/Answer:(.*)/s);

    if (!questionMatch || !answerMatch) {
      throw new Error('Failed to parse question and answer from GPT response');
    }

    return {
      question: questionMatch[1].trim(),
      answer: answerMatch[1].trim()
    };
  } catch (error) {
    console.error('Error generating question with GPT:', error);
    sendEmergencyReport('GPT_ERROR', `Error generating question: ${error.message}`, 'gptService.js', '');
    throw new Error('Failed to generate question');
  }
};
