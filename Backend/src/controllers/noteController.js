const { supabase } = require('../services/supabase');
const ocrHelper = require('../utils/ocrHelper');
const { fuzzySearch } = require('../utils/fuzzySearch');

exports.createNote = async (req, res, next) => {
  try {
    const { title, content } = req.body;

    const { data, error } = await supabase
      .from('notes')
      .insert({ user_id: req.user.id, title, content })
      .single();

    if (error) throw error;

    res.status(201).json(data);
  } catch (error) {
    next(error);
  }
};

exports.getAllNotes = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('notes')
      .select('*')
      .eq('user_id', req.user.id);

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.getNoteById = async (req, res, next) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('notes')
      .select('*')
      .eq('id', id)
      .eq('user_id', req.user.id)
      .single();

    if (error) throw error;

    if (!data) {
      return res.status(404).json({ message: 'Note not found' });
    }

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.updateNote = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { title, content } = req.body;

    const { data, error } = await supabase
      .from('notes')
      .update({ title, content })
      .eq('id', id)
      .eq('user_id', req.user.id)
      .single();

    if (error) throw error;

    if (!data) {
      return res.status(404).json({ message: 'Note not found' });
    }

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.deleteNote = async (req, res, next) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('notes')
      .delete()
      .eq('id', id)
      .eq('user_id', req.user.id);

    if (error) throw error;

    if (data.length === 0) {
      return res.status(404).json({ message: 'Note not found' });
    }

    res.status(204).send();
  } catch (error) {
    next(error);
  }
};

exports.createNoteFromImage = async (req, res, next) => {
  try {
    if (!req.file) {
      return res.status(400).json({ message: 'No image file provided' });
    }

    const { text, confidence } = await ocrHelper.convertImageToText(req.file.buffer);

    if (confidence < 0.7) {
      return res.status(400).json({ message: 'Image text quality too low' });
    }

    // Create note with OCR text
    const { data, error } = await supabase
      .from('notes')
      .insert({
        user_id: req.user.id,
        title: 'OCR Note',
        content: text
      })
      .single();

    if (error) throw error;

    res.status(201).json(data);
  } catch (error) {
    next(error);
  }
};

exports.searchNotes = async (req, res, next) => {
  try {
    const { query } = req.query;
    if (!query) return res.status(400).json({ message: 'Search query required' });

    // First get all user's notes
    const { data, error } = await supabase
      .from('notes')
      .select('*')
      .eq('user_id', req.user.id);

    if (error) throw error;

    // Apply fuzzy search
    const searchResults = fuzzySearch(data, query, ['title', 'content'], 0.4);

    // Cache search results
    const cacheKey = `search:notes:${req.user.id}:${query}`;
    cache.set(cacheKey, searchResults, 300000); // Cache for 5 minutes

    res.status(200).json(searchResults);
  } catch (error) {
    next(error);
  }
};
