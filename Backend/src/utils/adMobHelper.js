const { google } = require('googleapis');
const adsense = google.adsense('v2');
const { supabase } = require('./supabaseClient');

exports.getAd = async (userId) => {
  try {
    const { data, error } = await supabase
      .from('users')
      .select('subscription_status')
      .eq('id', userId)
      .single();

    if (error) throw error;

    if (data.subscription_status === 'pro') {
      return null; // No ads for pro users
    }

    const res = await adsense.accounts.adclients.adunits.list({
      accountId: process.env.ADMOB_ACCOUNT_ID,
      adClientId: process.env.ADMOB_AD_CLIENT_ID,
    });

    const adUnits = res.data.adUnits;
    return adUnits[Math.floor(Math.random() * adUnits.length)];
  } catch (error) {
    console.error('Error fetching ad:', error);
    return null;
  }
};
