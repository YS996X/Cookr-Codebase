const express = require('express');
const router = express.Router();
const noteController = require('../controllers/noteController');
const { authenticateToken } = require('../middleware/auth');
const upload = require('../middleware/upload');

router.post('/', authenticateToken, noteController.createNote);
router.get('/', authenticateToken, noteController.getAllNotes);
router.get('/:id', authenticateToken, noteController.getNoteById);
router.put('/:id', authenticateToken, noteController.updateNote);
router.delete('/:id', authenticateToken, noteController.deleteNote);
router.post('/ocr', 
  authenticateToken,
  upload.single('image'),  // Multer middleware for file upload
  noteController.createNoteFromImage
);
router.get('/search', authenticateToken, noteController.searchNotes);

module.exports = router;
