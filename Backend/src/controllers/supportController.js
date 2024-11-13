exports.getDiscordInvite = (req, res) => {
  res.json({ inviteLink: process.env.APP_SUPPORT_DISCORD_SERVER });
};

