const { supabase } = require('../services/supabase');

exports.checkHealth = async (req, res, next) => {
  try {
    res.status(200).json({
      status: 'healthy',
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    next(error);
  }
};

exports.checkDatabaseConnection = async (req, res, next) => {
  try {
    const { data, error } = await supabase.from('health_check').select('*').limit(1);

    if (error) throw error;

    res.status(200).json({
      status: 'connected',
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    res.status(500).json({
      status: 'disconnected',
      error: error.message,
      timestamp: new Date().toISOString()
    });
  }
};
