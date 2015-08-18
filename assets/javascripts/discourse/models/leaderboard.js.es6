let Leaderboard = Discourse.Model.extend({
  users: function(){
    return this.get("/users")
  }.property("users"),

  challenges: function(){
    return this.get("/challenges")
  }.property("challenges")
});
