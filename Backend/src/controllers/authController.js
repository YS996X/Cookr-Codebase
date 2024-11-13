const { supabase } = require('../services/supabase');
const { generateUsername, sanitizeInput } = require('../utils/helpers');
const { OAuth2Client } = require('google-auth-library');
const { validateGoogleSignIn } = require('../utils/validators');

const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID);

exports.googleSignIn = async (req, res, next) => {
  try {
    const { 
      token, 
      platform,
      userId,
      name,
      username,
      email,
      profilePicture 
    } = req.body;

    const clientId = platform === 'ios' 
      ? process.env.GOOGLE_CLIENT_ID_IOS 
      : process.env.GOOGLE_CLIENT_ID_ANDROID;

    // Verify the Google token
    const ticket = await client.verifyIdToken({
      idToken: token,
      audience: clientId,
    });

    const payload = ticket.getPayload();
    
    // Verify email matches
    if (payload.email !== email) {
      return res.status(400).json({ message: 'Invalid token' });
    }

    // Check if user exists
    let { data: existingUser, error: fetchError } = await supabase
      .from('users')
      .select('*')
      .eq('email', email)
      .single();

    if (fetchError && fetchError.code !== 'PGRST116') {
      throw fetchError;
    }

    if (!existingUser) {
      // Create new user
      const { data: newUser, error: createError } = await supabase
        .from('users')
        .insert({
          id: userId,
          email: email,
          name: name,
          username: username,
          profile_picture: profilePicture,
          join_date: new Date().toISOString(),
          streak: 0,
          aura_points: 0,
          subscription_status: 'free',
          last_ip: req.ip || req.connection.remoteAddress
        })
        .single();

      if (createError) throw createError;
      existingUser = newUser;
    }

    // Generate session with Supabase
    const { session, error: signInError } = await supabase.auth.signIn({
      email,
      provider: 'google',
    });

    if (signInError) throw signInError;

    res.status(200).json({ 
      message: 'Sign in successful', 
      user: existingUser, 
      session 
    });
  } catch (error) {
    next(error);
  }
};

exports.logout = async (req, res, next) => {
  try {
    const { error } = await supabase.auth.signOut();
    if (error) throw error;
    res.status(200).json({ message: 'Logout successful' });
  } catch (error) {
    next(error);
  }
};

exports.getCurrentUser = async (req, res, next) => {
  try {
    const { user } = req;
    if (!user) {
      return res.status(401).json({ message: 'Not authenticated' });
    }
    const { data, error } = await supabase
      .from('users')
      .select('*')
      .eq('id', user.id)
      .single();

    if (error) throw error;
    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

exports.signup = async (req, res, next) => {
  // Implement signup logic
};

exports.login = async (req, res, next) => {
  // Implement login logic
};
