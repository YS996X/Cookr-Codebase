const { supabase } = require('../utils/supabaseClient');

const pdfUploadLimiter = async (req, res, next) => {
  try {
    const { user } = req;

    // Check user's subscription status
    const { data: userData, error: userError } = await supabase
      .from('users')
      .select('subscription_status')
      .eq('id', user.id)
      .single();

    if (userError) throw userError;

    const dailyLimit = userData.subscription_status === 'pro' ? 10 : 2;

    // Check number of uploads in the last 24 hours
    const twentyFourHoursAgo = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
    const { count, error: uploadsError } = await supabase
      .from('notes')
      .select('count', { count: 'exact' })
      .eq('user_id', user.id)
      .gte('created_at', twentyFourHoursAgo)
      .eq('is_pdf', true);

    if (uploadsError) throw uploadsError;

    if (count >= dailyLimit) {
      return res.status(429).json({ message: 'Daily PDF upload limit reached' });
    }

    next();
  } catch (error) {
    next(error);
  }
};

module.exports = pdfUploadLimiter;
