const { supabase } = require('../services/supabase');
const { fuzzySearch } = require('../utils/fuzzySearch');

exports.getUserProfile = async (req, res, next) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .select('*')
      .eq('id', req.user.id)
      .single();

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.updateUserProfile = async (req, res, next) => {
  try {
    const { username, bio } = req.body;

    const { data, error } = await supabase
      .from('users')
      .update({ username, bio })
      .eq('id', req.user.id)
      .single();

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.searchUsers = async (req, res, next) => {
  try {
    const { query } = req.query;
    if (!query) return res.status(400).json({ message: 'Search query required' });

    // Get users
    const { data, error } = await supabase
      .from('users')
      .select('id, username, name, profile_picture, aura_points');

    if (error) throw error;

    // Apply fuzzy search
    const searchResults = fuzzySearch(data, query, ['username', 'name'], 0.5)
      .slice(0, 20); // Limit to 20 results

    res.status(200).json(searchResults);
  } catch (error) {
    next(error);
  }
};

exports.changeUsername = async (req, res, next) => {
  try {
    const { newUsername } = req.body;
    
    // Check if the new username is already taken
    const { data: existingUser, error: checkError } = await supabase
      .from('users')
      .select('id')
      .eq('username', newUsername)
      .single();

    if (checkError && checkError.code !== 'PGRST116') throw checkError;
    if (existingUser) return res.status(400).json({ message: 'Username already taken' });

    // Update the username
    const { data, error } = await supabase
      .from('users')
      .update({ username: newUsername })
      .eq('id', req.user.id)
      .single();

    if (error) throw error;

    res.status(200).json({ message: 'Username updated successfully', newUsername });
  } catch (error) {
    next(error);
  }
};
