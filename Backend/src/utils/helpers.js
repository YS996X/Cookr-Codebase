const { supabase } = require('../services/supabase');

exports.generateUsername = async () => {
  const adjectives = ['Happy', 'Sunny', 'Clever', 'Bright', 'Swift'];
  const nouns = ['Panda', 'Tiger', 'Dolphin', 'Eagle', 'Lion'];
  
  let username;
  let isUnique = false;
  
  while (!isUnique) {
    const adjective = adjectives[Math.floor(Math.random() * adjectives.length)];
    const noun = nouns[Math.floor(Math.random() * nouns.length)];
    const number = Math.floor(Math.random() * 1000);
    
    username = `${adjective}${noun}${number}`;
    
    const { data, error } = await supabase
      .from('users')
      .select('username')
      .eq('username', username);
    
    if (error) throw error;
    
    if (data.length === 0) {
      isUnique = true;
    }
  }
  
  return username;
};

exports.sanitizeInput = (input) => {
  // Implement input sanitization logic
  return input.replace(/[<>&'"]/g, function (c) {
    switch (c) {
      case '<': return '&lt;';
      case '>': return '&gt;';
      case '&': return '&amp;';
      case "'": return '&#39;';
      case '"': return '&quot;';
    }
  });
};

exports.formatDate = (date) => {
  return new Date(date).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  });
};
