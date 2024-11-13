const express = require('express');
const authController = require('../controllers/authController');
const authMiddleware = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/google-signin', authController.googleSignIn);
router.post('/logout', authMiddleware, authController.logout);
router.get('/user', authMiddleware, authController.getCurrentUser);

module.exports = router;
