const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const { authenticateToken } = require('../middleware/auth');

router.post('/google-signin', authController.googleSignIn);
router.post('/logout', authenticateToken, authController.logout);
router.get('/user', authenticateToken, authController.getCurrentUser);

module.exports = router;
