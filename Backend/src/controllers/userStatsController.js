const { supabase } = require('../services/supabase');

exports.getUserStats = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('user_stats')
      .select('*')
      .eq('user_id', req.user.id)
      .single();

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.updateUserStats = async (req, res, next) => {
  try {
    const { studyTime, questionsAnswered } = req.body;

    const { data, error } = await supabase
      .from('user_stats')
      .upsert({
        user_id: req.user.id,
        total_study_time: supabase.raw(`total_study_time + ${studyTime}`),
        total_questions_answered: supabase.raw(`total_questions_answered + ${questionsAnswered}`),
        last_study_date: new Date().toISOString()
      })
      .select();

    if (error) throw error;

    res.status(200).json(data[0]);
  } catch (error) {
    next(error);
  }
};

exports.getUserStreak = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .select('streak')
      .eq('id', req.user.id)
      .single();

    if (error) throw error;

    res.status(200).json({ streak: data.streak });
  } catch (error) {
    next(error);
  }
};

exports.getUserAuraPoints = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .select('aura_points')
      .eq('id', req.user.id)
      .single();

    if (error) throw error;

    res.status(200).json({ auraPoints: data.aura_points });
  } catch (error) {
    next(error);
  }
};
