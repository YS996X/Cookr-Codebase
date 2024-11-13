const express = require('express');
const subscriptionController = require('../controllers/subscriptionController');
const { authenticateToken } = require('../middleware/auth');

const router = express.Router();

router.post('/create', authenticateToken, subscriptionController.createSubscription);
router.post('/webhook', subscriptionController.handleWebhook);
router.get('/status', authenticateToken, subscriptionController.getSubscriptionStatus);
router.post('/cancel', authenticateToken, subscriptionController.cancelSubscription);

module.exports = router;
