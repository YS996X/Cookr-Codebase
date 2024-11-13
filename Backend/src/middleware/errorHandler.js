const { sendEmergencyReport } = require('../utils/reportingHelper');

const errorHandler = (err, req, res, next) => {
  console.error(err.stack);

  // Send emergency report for server errors
  if (err.status >= 500) {
    sendEmergencyReport('SERVER_ERROR', err.message, err.fileName, err.lineNumber);
  }

  res.status(err.status || 500).json({
    error: {
      message: err.message || 'Internal Server Error',
      ...(process.env.NODE_ENV === 'development' && { stack: err.stack }),
    },
  });
};

module.exports = errorHandler;
