const express = require('express');
const router = express.Router();
const supportController = require('../controllers/supportController');

router.get('/discord-invite', supportController.getDiscordInvite);

module.exports = router;
