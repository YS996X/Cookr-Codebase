// Import required modules
const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const rateLimit = require('express-rate-limit');
const helmet = require('helmet');
const cron = require('node-cron');
const securityAudit = require('./securityAudit');
const compression = require('compression');

// Import all routes
const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/userRoutes');
const noteRoutes = require('./routes/noteRoutes');
const studySetRoutes = require('./routes/studySetRoutes');
const questionRoutes = require('./routes/questionRoutes');
const leaderboardRoutes = require('./routes/leaderboardRoutes');
const userStatsRoutes = require('./routes/userStatsRoutes');
const subscriptionRoutes = require('./routes/subscriptionRoutes');
const feedRoutes = require('./routes/feedRoutes');
const studyModeRoutes = require('./routes/studyModeRoutes');
const v1Routes = require('./routes/v1Routes');
const healthCheckRoutes = require('./routes/healthCheckRoutes');
const supportRoutes = require('./routes/supportRoutes');

// Import middleware
const errorHandler = require('./middleware/errorHandler');
const suspiciousActivityDetector = require('./middleware/suspiciousActivityDetector');

// Import utilities
const { setupScheduledTasks } = require('./utils/scheduledTasks');
const { sendWeeklyReport } = require('./utils/reportingHelper');

// Load environment variables
dotenv.config();

// Create Express app
const app = express();

// Apply security middleware
app.use(helmet());
app.use(cors());

// General rate limiter
const generalLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});
app.use(generalLimiter);

// Specific rate limiter for question generation
const questionGenerationLimiter = rateLimit({
  windowMs: 60 * 60 * 1000, // 1 hour
  max: 50 // limit each IP to 50 question generation requests per hour
});
app.use('/api/questions/generate', questionGenerationLimiter);

// Parse JSON bodies
app.use(express.json());

// Apply global middleware
app.use(suspiciousActivityDetector);

// Apply compression
app.use(compression());

// Apply routes
// Note: All these routes will be prefixed with '/api'
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/notes', noteRoutes);
app.use('/api/studysets', studySetRoutes);
app.use('/api/questions', questionRoutes);
app.use('/api/leaderboard', leaderboardRoutes);
app.use('/api/user-stats', userStatsRoutes);
app.use('/api/subscriptions', subscriptionRoutes);
app.use('/api/feed', feedRoutes);
app.use('/api/study-mode', studyModeRoutes);
app.use('/api/v1', v1Routes);
app.use('/health', healthCheckRoutes);
app.use('/api/support', supportRoutes);

// Error handling middleware
app.use(errorHandler);

// Implement security measures
securityAudit(app);

// Set up scheduled tasks
setupScheduledTasks();

// Set up weekly report
cron.schedule('0 0 * * 0', sendWeeklyReport);

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

module.exports = app;
