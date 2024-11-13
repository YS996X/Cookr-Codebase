const Joi = require('joi');

const studySetSchema = Joi.object({
  title: Joi.string().required().min(3).max(100),
  noteIds: Joi.array().items(Joi.string().uuid()).min(1).required()
});

const noteSchema = Joi.object({
  title: Joi.string().required().min(3).max(100),
  content: Joi.string().required().min(10)
});

const userSchema = Joi.object({
  username: Joi.string().alphanum().min(3).max(30).required(),
  email: Joi.string().email().required(),
  password: Joi.string().pattern(new RegExp('^[a-zA-Z0-9]{3,30}$')).required()
});

exports.validateStudySetInput = (title, noteIds) => {
  const { error } = studySetSchema.validate({ title, noteIds });
  return error ? error.details[0].message : null;
};

exports.validateNoteInput = (title, content) => {
  const { error } = noteSchema.validate({ title, content });
  return error ? error.details[0].message : null;
};

exports.validateUserInput = (username, email, password) => {
  const { error } = userSchema.validate({ username, email, password });
  return error ? error.details[0].message : null;
};

exports.validateGoogleSignIn = (data) => {
  const schema = Joi.object({
    token: Joi.string().required(),
    userId: Joi.string().required(),
    name: Joi.string().required(),
    username: Joi.string().required(),
    email: Joi.string().email().required(),
    profilePicture: Joi.string().uri().allow(null, '')
  });
  return schema.validate(data);
};

// Add other validators as needed
