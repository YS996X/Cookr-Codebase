const express = require('express');
const router = express.Router();
const { authenticateToken } = require('../middleware/auth');
const feedController = require('../controllers/feedController');

router.get('/', authenticateToken, feedController.getFeed);
router.post('/like', authenticateToken, feedController.likeItem);
router.post('/save', authenticateToken, feedController.saveItem);

module.exports = router;
