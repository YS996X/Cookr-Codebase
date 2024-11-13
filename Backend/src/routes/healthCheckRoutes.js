const express = require('express');
const router = express.Router();
const healthCheckController = require('../controllers/healthCheckController');

router.get('/', healthCheckController.checkHealth);
router.get('/db', healthCheckController.checkDatabaseConnection);

module.exports = router;
