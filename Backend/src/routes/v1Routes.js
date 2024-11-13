const express = require('express');
const router = express.Router();
const { authenticateToken } = require('../middleware/auth');
const v1Controller = require('../controllers/v1Controller');

// This route file can be used for versioning your API
// You can add specific v1 endpoints here

router.get('/status', v1Controller.getApiStatus);

module.exports = router;
