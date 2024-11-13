const axios = require('axios');
const { supabase } = require('../services/supabase');

const DISCORD_WEBHOOK_URL = process.env.DISCORD_WEBHOOK_URL;

exports.sendWeeklyReport = async () => {
  // Implement weekly report generation logic here
  const report = await generateWeeklyReport();

  const payload = {
    content: '**Weekly Report**\n' + report,
  };

  try {
    await axios.post(DISCORD_WEBHOOK_URL, payload);
  } catch (error) {
    console.error('Failed to send weekly report to Discord:', error);
  }
};

async function generateWeeklyReport() {
  // Implement report generation logic
  // This should include fetching data from your database and formatting it
  return 'Weekly report content goes here';
}

exports.sendEmergencyReport = async (type, message, fileName, lineNumber) => {
  const payload = {
    content: `@everyone **${type}**: ${message}\nFile: ${fileName}\nLine: ${lineNumber}`,
  };

  try {
    await axios.post(DISCORD_WEBHOOK_URL, payload);
    
    // Log error to database
    await supabase.from('error_logs').insert({
      type,
      message,
      file_name: fileName,
      line_number: lineNumber,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Failed to send emergency report:', error);
  }
};

function generateInsights(newUsers, upgradedUsers, studySets, questions) {
  let insights = [];

  if (newUsers > 100) insights.push("User growth is strong this week!");
  if (upgradedUsers > 50) insights.push("Pro user conversions are performing well.");
  if (studySets > 1000) insights.push("Users are creating a lot of study sets!");
  if (questions > 10000) insights.push("Question generation is very active.");

  return insights.length > 0 ? "Insights:\n- " + insights.join("\n- ") : "No significant insights this week.";
}
