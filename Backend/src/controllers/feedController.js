const { supabase } = require('../services/supabase');

exports.getFeed = async (req, res, next) => {
  try {
    // Implement feed retrieval logic here
    // This might involve fetching recent questions or study sets

    const { data, error } = await supabase
      .from('feed_items')
      .select('*')
      .order('created_at', { ascending: false })
      .limit(20);

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.likeItem = async (req, res, next) => {
  try {
    const { itemId } = req.body;

    const { data, error } = await supabase
      .from('likes')
      .insert({ user_id: req.user.id, item_id: itemId });

    if (error) throw error;

    res.status(200).json({ message: 'Item liked successfully' });
  } catch (error) {
    next(error);
  }
};

exports.saveItem = async (req, res, next) => {
  try {
    const { itemId } = req.body;

    const { data, error } = await supabase
      .from('saved_items')
      .insert({ user_id: req.user.id, item_id: itemId });

    if (error) throw error;

    res.status(200).json({ message: 'Item saved successfully' });
  } catch (error) {
    next(error);
  }
};
