exports.getApiStatus = async (req, res, next) => {
  try {
    res.status(200).json({
      status: 'operational',
      version: '1.0.0',
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    next(error);
  }
};
