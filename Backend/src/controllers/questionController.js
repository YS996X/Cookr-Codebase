const { supabase } = require('../services/supabase');
const { generateQuestionWithGPT } = require('../services/gptService');

exports.generateQuestions = async (req, res, next) => {
  try {
    const { studySetId } = req.body;

    // Fetch study set and associated notes
    const { data: studySet, error: studySetError } = await supabase
      .from('study_sets')
      .select('*, notes(*)')
      .eq('id', studySetId)
      .single();

    if (studySetError) throw studySetError;

    if (!studySet) {
      return res.status(404).json({ message: 'Study set not found' });
    }

    // Generate questions using GPT-3.5 Turbo
    const questions = await Promise.all(studySet.notes.map(async (note) => {
      const question = await generateQuestionWithGPT(note.content);
      return {
        study_set_id: studySetId,
        note_id: note.id,
        question: question.question,
        answer: question.answer,
        user_id: req.user.id
      };
    }));

    // Save generated questions to database
    const { data: savedQuestions, error: insertError } = await supabase
      .from('questions')
      .insert(questions)
      .select();

    if (insertError) throw insertError;

    res.status(201).json(savedQuestions);
  } catch (error) {
    next(error);
  }
};

exports.getQuestionsForStudySet = async (req, res, next) => {
  try {
    const { studySetId } = req.params;

    const { data, error } = await supabase
      .from('questions')
      .select('*')
      .eq('study_set_id', studySetId)
      .eq('user_id', req.user.id);

    if (error) throw error;

    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.likeQuestion = async (req, res, next) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('liked_questions')
      .insert({ user_id: req.user.id, question_id: id })
      .single();

    if (error) throw error;

    res.status(201).json(data);
  } catch (error) {
    next(error);
  }
};

exports.saveQuestion = async (req, res, next) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('saved_questions')
      .insert({ user_id: req.user.id, question_id: id })
      .single();

    if (error) throw error;

    res.status(201).json(data);
  } catch (error) {
    next(error);
  }
};

exports.unlikeQuestion = async (req, res, next) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('liked_questions')
      .delete()
      .eq('user_id', req.user.id)
      .eq('question_id', id);

    if (error) throw error;

    res.status(204).send();
  } catch (error) {
    next(error);
  }
};

exports.unsaveQuestion = async (req, res, next) => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('saved_questions')
      .delete()
      .eq('user_id', req.user.id)
      .eq('question_id', id);

    if (error) throw error;

    res.status(204).send();
  } catch (error) {
    next(error);
  }
};

exports.shareQuestion = async (req, res, next) => {
  try {
    const { id } = req.params;

    // Generate a unique sharing ID
    const sharingId = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);

    const { data, error } = await supabase
      .from('shared_questions')
      .insert({ question_id: id, sharing_id: sharingId, user_id: req.user.id })
      .single();

    if (error) throw error;

    const shareLink = `${process.env.APP_URL}/shared-question/${sharingId}`;

    res.status(201).json({ sharingId, shareLink });
  } catch (error) {
    next(error);
  }
};

exports.getSharedQuestion = async (req, res, next) => {
  try {
    const { sharingId } = req.params;

    const { data, error } = await supabase
      .from('shared_questions')
      .select('questions(*), users(username)')
      .eq('sharing_id', sharingId)
      .single();

    if (error) throw error;

    if (!data) {
      return res.status(404).json({ message: 'Shared question not found' });
    }

    res.status(200).json({
      question: data.questions,
      sharedBy: data.users.username
    });
  } catch (error) {
    next(error);
  }
};
