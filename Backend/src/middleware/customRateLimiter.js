const rateLimit = require('express-rate-limit');
const RedisStore = require('rate-limit-redis');
const redisClient = require('../utils/redisClient');

const createRateLimiter = (windowMs, max, message) => {
  return rateLimit({
    store: new RedisStore({
      client: redisClient,
      prefix: 'rate-limit:',
    }),
    windowMs,
    max,
    message: { message },
    headers: true,
  });
};

module.exports = {
  globalLimiter: createRateLimiter(15 * 60 * 1000, 100, 'Too many requests from this IP, please try again later.'),
  authLimiter: createRateLimiter(15 * 60 * 1000, 5, 'Too many authentication attempts, please try again later.'),
  createStudySetLimiter: createRateLimiter(60 * 60 * 1000, 10, 'Too many study sets created, please try again later.'),
  questionGenerationLimiter: createRateLimiter(60 * 1000, 5, 'Too many questions generated, please try again later.'),
};
