const { supabase } = require('../utils/supabaseClient');
const { sendEmergencyReport } = require('../utils/reportingHelper');

const THRESHOLD_REQUESTS_PER_MINUTE = 100;
const THRESHOLD_QUESTIONS_PER_MINUTE = 20;

const suspiciousActivityDetector = async (req, res, next) => {
  try {
    const { user } = req;
    const now = new Date();
    const oneMinuteAgo = new Date(now.getTime() - 60000);

    // Check request frequency
    const { count: requestCount, error: requestError } = await supabase
      .from('user_actions')
      .select('count', { count: 'exact' })
      .eq('user_id', user.id)
      .gte('timestamp', oneMinuteAgo.toISOString());

    if (requestError) throw requestError;

    if (requestCount > THRESHOLD_REQUESTS_PER_MINUTE) {
      await sendEmergencyReport('SUSPICIOUS ACTIVITY', `User ${user.id} exceeded request threshold`, 'suspiciousActivityDetector.js', '');
      return res.status(429).json({ message: 'Too many requests' });
    }

    // Check question generation frequency
    if (req.path.includes('/questions/generate')) {
      const { count: questionCount, error: questionError } = await supabase
        .from('questions')
        .select('count', { count: 'exact' })
        .eq('user_id', user.id)
        .gte('created_at', oneMinuteAgo.toISOString());

      if (questionError) throw questionError;

      if (questionCount > THRESHOLD_QUESTIONS_PER_MINUTE) {
        await sendEmergencyReport('SUSPICIOUS ACTIVITY', `User ${user.id} exceeded question generation threshold`, 'suspiciousActivityDetector.js', '');
        return res.status(429).json({ message: 'Too many questions generated' });
      }
    }

    // Log user action
    await supabase
      .from('user_actions')
      .insert({ user_id: user.id, action: req.path, timestamp: now.toISOString() });

    next();
  } catch (error) {
    next(error);
  }
};

module.exports = suspiciousActivityDetector;
