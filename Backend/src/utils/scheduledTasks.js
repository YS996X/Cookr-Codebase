const cron = require('node-cron');
const { supabase } = require('../services/supabase');
const { sendWeeklyReport } = require('./reportingHelper');

exports.setupScheduledTasks = () => {
  // Reset "cooked this session" counter daily at 12 AM
  cron.schedule('0 0 * * *', async () => {
    try {
      const { error } = await supabase
        .from('users')
        .update({ cooked_this_session: 0 });

      if (error) throw error;
      console.log('Reset cooked this session counter');
    } catch (error) {
      console.error('Error resetting cooked this session counter:', error);
    }
  });

  // Update streaks daily at 12 AM
  cron.schedule('0 0 * * *', async () => {
    try {
      const today = new Date().toISOString().split('T')[0];
      const yesterday = new Date(Date.now() - 86400000).toISOString().split('T')[0];

      const { data: users, error } = await supabase
        .from('users')
        .select('id, last_study_date, streak');

      if (error) throw error;

      for (const user of users) {
        if (user.last_study_date === yesterday) {
          await supabase
            .from('users')
            .update({ streak: user.streak + 1, last_study_date: today })
            .eq('id', user.id);
        } else if (user.last_study_date !== today) {
          await supabase
            .from('users')
            .update({ streak: 0, last_study_date: today })
            .eq('id', user.id);
        }
      }

      console.log('Updated user streaks');
    } catch (error) {
      console.error('Error updating user streaks:', error);
    }
  });

  // Update leaderboard daily at 1 AM
  cron.schedule('0 1 * * *', async () => {
    try {
      const { data: topUsers, error } = await supabase
        .from('users')
        .select('id, username, name, profile_picture, aura_points')
        .gte('aura_points', 350)
        .order('aura_points', { ascending: false })
        .limit(10);

      if (error) throw error;

      const { error: updateError } = await supabase
        .from('leaderboard')
        .delete()
        .then(() => supabase.from('leaderboard').insert(topUsers));

      if (updateError) throw updateError;

      console.log('Updated leaderboard');
    } catch (error) {
      console.error('Error updating leaderboard:', error);
    }
  });

  // Send weekly report every Sunday at 11:59 PM
  cron.schedule('59 23 * * 0', sendWeeklyReport);
};

exports.startTasks = () => {
  // Reset daily counters at midnight
  cron.schedule('0 0 * * *', resetDailyCounters);

  // Update streaks at midnight
  cron.schedule('0 0 * * *', updateStreaks);

  // Update leaderboard at 1 AM
  cron.schedule('0 1 * * *', updateLeaderboard);

  // Generate weekly report on Sundays at 2 AM
  cron.schedule('0 2 * * 0', generateWeeklyReport);
};
