const express = require('express');
const studySetController = require('../controllers/studySetController');
const { authenticateToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', authenticateToken, studySetController.createStudySet);
router.get('/', authenticateToken, studySetController.getAllStudySets);
router.get('/:id', authenticateToken, studySetController.getStudySetById);
router.put('/:id', authenticateToken, studySetController.updateStudySet);
router.delete('/:id', authenticateToken, studySetController.deleteStudySet);
router.post('/:id/mode', authenticateToken, studySetController.switchStudyMode);

module.exports = router;
