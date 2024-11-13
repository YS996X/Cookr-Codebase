const axios = require('axios');

exports.generateQuestion = async (notes, previousQuestionNum = '') => {
  const prompt = `Based on the following notes, create a practice question and its answer. The question and answer together must not exceed 75 words. Format: Question: [Your question here] Answer: [Your answer here]. Previous question number: ${previousQuestionNum}. Notes: ${notes}`;

  try {
    const response = await axios.post('https://api.openai.com/v1/engines/text-davinci-002/completions', {
      prompt,
      max_tokens: 150,
      temperature: 0.7,
      top_p: 1,
      frequency_penalty: 0,
      presence_penalty: 0
    }, {
      headers: {
        'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`,
        'Content-Type': 'application/json'
      }
    });

    const generatedText = response.data.choices[0].text.trim();
    const [question, answer] = generatedText.split('Answer:');

    return {
      question: question.replace('Question:', '').trim(),
      answer: answer.trim()
    };
  } catch (error) {
    console.error('Error generating question:', error);
    throw error;
  }
};

exports.generateMCQQuestion = async (notes) => {
  const prompt = `Based on the following notes, create a multiple-choice question with four options (a, b, c, d) and indicate the correct answer. Notes: ${notes}`;

  try {
    const response = await axios.post('https://api.openai.com/v1/engines/text-davinci-002/completions', {
      prompt,
      max_tokens: 200,
      temperature: 0.7,
      top_p: 1,
      frequency_penalty: 0,
      presence_penalty: 0
    }, {
      headers: {
        'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`,
        'Content-Type': 'application/json'
      }
    });

    const generatedText = response.data.choices[0].text.trim();
    const [question, ...options] = generatedText.split('\n');
    const correctAnswer = options.pop().replace('Correct answer: ', '').trim();

    return {
      question: question.trim(),
      options: options.map(option => option.trim()),
      correctAnswer
    };
  } catch (error) {
    console.error('Error generating MCQ question:', error);
    throw error;
  }
};
