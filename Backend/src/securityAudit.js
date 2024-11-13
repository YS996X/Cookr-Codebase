const helmet = require('helmet');

const securityAudit = (app) => {
  // Set security headers
  app.use(helmet());

  // Implement Content Security Policy
  app.use(helmet.contentSecurityPolicy({
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'", "'unsafe-inline'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      imgSrc: ["'self'", "data:", "https:"],
    },
  }));

  // Prevent clickjacking
  app.use(helmet.frameguard({ action: 'deny' }));

  // Disable X-Powered-By header
  app.disable('x-powered-by');
};

module.exports = securityAudit;
