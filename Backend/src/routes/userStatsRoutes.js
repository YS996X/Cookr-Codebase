const express = require('express');
const userStatsController = require('../controllers/userStatsController');
const { authenticateToken } = require('../middleware/auth');

const router = express.Router();

router.get('/', authenticateToken, userStatsController.getUserStats);
router.get('/streak', authenticateToken, userStatsController.getUserStreak);
router.get('/aura-points', authenticateToken, userStatsController.getUserAuraPoints);

module.exports = router;
