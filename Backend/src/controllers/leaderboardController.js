const { supabase } = require('../services/supabase');
const cache = require('../utils/cache');

exports.getLeaderboard = async (req, res, next) => {
  try {
    const cacheKey = 'leaderboard';
    const cachedData = cache.get(cacheKey);
    
    if (cachedData) {
      return res.status(200).json(cachedData);
    }

    const { data, error } = await supabase
      .from('users')
      .select('username, name, profile_picture, aura_points')
      .gte('aura_points', 350)
      .order('aura_points', { ascending: false })
      .limit(10);

    if (error) throw error;

    // Cache for 5 minutes
    cache.set(cacheKey, data, 300000);

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};
