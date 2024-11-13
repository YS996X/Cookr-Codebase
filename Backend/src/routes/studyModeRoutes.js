const express = require('express');
const router = express.Router();
const { authenticateToken } = require('../middleware/auth');
const studyModeController = require('../controllers/studyModeController');

router.post('/start', authenticateToken, studyModeController.startStudyMode);
router.post('/end', authenticateToken, studyModeController.endStudyMode);
router.get('/progress', authenticateToken, studyModeController.getStudyProgress);

module.exports = router;
