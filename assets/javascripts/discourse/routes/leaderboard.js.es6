export default Discourse.LeaderboardRoute = Discourse.Route.extend({
  beforeModel: function() { return this.redirectIfLoginRequired(); },

  model: function() {
    return Discourse.ajax('/leaderboard');
  }
});
