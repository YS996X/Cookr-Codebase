const express = require('express');
const questionController = require('../controllers/questionController');
const { authenticateToken } = require('../middleware/auth');
const { 
  gptLimiter, 
  validateContent, 
  gptCache, 
  sanitizePrompt, 
  isAbusiveRequest 
} = require('../middleware/gptApiProtection');

const router = express.Router();

router.post('/generate', 
  authenticateToken,          // First check auth
  gptLimiter,                // Then check rate limit
  validateContent,           // Validate and sanitize content
  gptCache,                  // Check cache before generating
  questionController.generateQuestions
);
router.get('/:studySetId', authenticateToken, questionController.getQuestionsForStudySet);
router.post('/:id/like', authenticateToken, questionController.likeQuestion);
router.post('/:id/save', authenticateToken, questionController.saveQuestion);
router.delete('/:id/like', authenticateToken, questionController.unlikeQuestion);
router.delete('/:id/save', authenticateToken, questionController.unsaveQuestion);
router.post('/:id/share', authenticateToken, questionController.shareQuestion);
router.get('/shared/:sharingId', questionController.getSharedQuestion);

module.exports = router;
