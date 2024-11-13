const { supabase } = require('../services/supabase');
const cache = new Map();
const CACHE_DURATION = 300000; // 5 minutes in milliseconds

exports.createStudySet = async (req, res, next) => {
  try {
    const { title, noteIds } = req.body;

    const { data, error } = await supabase
      .from('study_sets')
      .insert({ user_id: req.user.id, title, note_ids: noteIds })
      .single();

    if (error) throw error;

    res.status(201).json(data);
  } catch (error) {
    next(error);
  }
};

exports.getAllStudySets = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('study_sets')
      .select('*')
      .eq('user_id', req.user.id);

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.getStudySetById = async (req, res, next) => {
  try {
    const { id } = req.params;
    const cacheKey = `study_set:${id}`;

    // Try to get data from cache
    const cachedData = cache.get(cacheKey);
    if (cachedData) {
      return res.status(200).json(JSON.parse(cachedData));
    }

    // If not in cache, fetch from database
    const { data, error } = await supabase
      .from('study_sets')
      .select('*')
      .eq('id', id)
      .eq('user_id', req.user.id)
      .single();

    if (error) throw error;

    if (!data) {
      return res.status(404).json({ message: 'Study set not found' });
    }

    // Cache the data
    cache.set(cacheKey, JSON.stringify(data), CACHE_DURATION); // Cache for 5 minutes

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.updateStudySet = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { title, noteIds } = req.body;

    const { data, error } = await supabase
      .from('study_sets')
      .update({ title, note_ids: noteIds })
      .eq('id', id)
      .eq('user_id', req.user.id)
      .single();

    if (error) throw error;

    if (!data) {
      return res.status(404).json({ message: 'Study set not found' });
    }

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.deleteStudySet = async (req, res, next) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('study_sets')
      .delete()
      .eq('id', id)
      .eq('user_id', req.user.id);

    if (error) throw error;

    if (data.length === 0) {
      return res.status(404).json({ message: 'Study set not found' });
    }

    res.status(204).send();
  } catch (error) {
    next(error);
  }
};

exports.switchStudyMode = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { mode } = req.body;

    if (!['standard', 'multiple_choice'].includes(mode)) {
      return res.status(400).json({ message: 'Invalid study mode' });
    }

    const { data, error } = await supabase
      .from('study_sets')
      .update({ current_mode: mode })
      .eq('id', id)
      .eq('user_id', req.user.id)
      .single();

    if (error) throw error;

    if (!data) {
      return res.status(404).json({ message: 'Study set not found' });
    }

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};
