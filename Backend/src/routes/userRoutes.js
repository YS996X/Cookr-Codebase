const express = require('express');
const userController = require('../controllers/userController');
const { authenticateToken } = require('../middleware/auth');

const router = express.Router();

router.get('/profile', authenticateToken, userController.getUserProfile);
router.put('/profile', authenticateToken, userController.updateUserProfile);
router.get('/search', authenticateToken, userController.searchUsers);
router.put('/change-username', authenticateToken, userController.changeUsername);

module.exports = router;
