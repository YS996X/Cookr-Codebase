// Implement Levenshtein Distance for fuzzy matching
function levenshteinDistance(str1, str2) {
  const m = str1.length;
  const n = str2.length;
  const dp = Array(m + 1).fill(null).map(() => Array(n + 1).fill(0));

  for (let i = 0; i <= m; i++) dp[i][0] = i;
  for (let j = 0; j <= n; j++) dp[0][j] = j;

  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      if (str1[i - 1] === str2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        dp[i][j] = Math.min(
          dp[i - 1][j - 1] + 1, // substitution
          dp[i - 1][j] + 1,     // deletion
          dp[i][j - 1] + 1      // insertion
        );
      }
    }
  }
  return dp[m][n];
}

// Calculate similarity score (0-1)
function calculateSimilarity(str1, str2) {
  const maxLength = Math.max(str1.length, str2.length);
  const distance = levenshteinDistance(str1.toLowerCase(), str2.toLowerCase());
  return 1 - (distance / maxLength);
}

exports.fuzzySearch = (items, searchTerm, fields, threshold = 0.6) => {
  return items.map(item => {
    let maxScore = 0;
    fields.forEach(field => {
      const similarity = calculateSimilarity(item[field], searchTerm);
      maxScore = Math.max(maxScore, similarity);
    });
    return { ...item, score: maxScore };
  })
  .filter(item => item.score >= threshold)
  .sort((a, b) => b.score - a.score);
}; 