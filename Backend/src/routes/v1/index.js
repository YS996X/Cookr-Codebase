const express = require('express');
const router = express.Router();

const authRoutes = require('../authRoutes');
const userRoutes = require('../userRoutes');
const noteRoutes = require('../noteRoutes');
const studySetRoutes = require('../studySetRoutes');
const questionRoutes = require('../questionRoutes');
const leaderboardRoutes = require('../leaderboardRoutes');
const userStatsRoutes = require('../userStatsRoutes');
const subscriptionRoutes = require('../subscriptionRoutes');
const feedRoutes = require('../feedRoutes');
const studyModeRoutes = require('../studyModeRoutes');

router.use('/auth', authRoutes);
router.use('/users', userRoutes);
router.use('/notes', noteRoutes);
router.use('/studysets', studySetRoutes);
router.use('/questions', questionRoutes);
router.use('/leaderboard', leaderboardRoutes);
router.use('/user-stats', userStatsRoutes);
router.use('/subscriptions', subscriptionRoutes);
router.use('/feed', feedRoutes);
router.use('/study-mode', studyModeRoutes);

module.exports = router;
