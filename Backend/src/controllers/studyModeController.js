const { supabase } = require('../services/supabase');

exports.switchStudyMode = async (req, res, next) => {
  try {
    const { user } = req;
    const { studySetId } = req.params;
    const { mode } = req.body;

    if (!['standard', 'mcq'].includes(mode)) {
      return res.status(400).json({ message: 'Invalid study mode' });
    }

    const { data, error } = await supabase
      .from('user_study_modes')
      .upsert({
        user_id: user.id,
        study_set_id: studySetId,
        mode
      })
      .select()
      .single();

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.getCurrentStudyMode = async (req, res, next) => {
  try {
    const { user } = req;
    const { studySetId } = req.params;

    const { data, error } = await supabase
      .from('user_study_modes')
      .select('mode')
      .eq('user_id', user.id)
      .eq('study_set_id', studySetId)
      .single();

    if (error) throw error;

    res.status(200).json({ mode: data ? data.mode : 'standard' });
  } catch (error) {
    next(error);
  }
};

exports.startStudyMode = async (req, res, next) => {
  try {
    const { studySetId } = req.body;

    const { data, error } = await supabase
      .from('study_sessions')
      .insert({ user_id: req.user.id, study_set_id: studySetId, start_time: new Date() });

    if (error) throw error;

    res.status(200).json({ message: 'Study mode started', sessionId: data[0].id });
  } catch (error) {
    next(error);
  }
};

exports.endStudyMode = async (req, res, next) => {
  try {
    const { sessionId } = req.body;

    const { data, error } = await supabase
      .from('study_sessions')
      .update({ end_time: new Date() })
      .eq('id', sessionId)
      .eq('user_id', req.user.id);

    if (error) throw error;

    res.status(200).json({ message: 'Study mode ended' });
  } catch (error) {
    next(error);
  }
};

exports.getStudyProgress = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('study_sessions')
      .select('*')
      .eq('user_id', req.user.id)
      .order('start_time', { ascending: false })
      .limit(10);

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};
