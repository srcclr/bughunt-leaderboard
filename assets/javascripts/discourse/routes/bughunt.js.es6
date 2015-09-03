export default Discourse.BughuntRoute = Discourse.Route.extend({
  beforeModel: function() { return this.redirectIfLoginRequired(); },

  model: function() {
    return Discourse.ajax('/bughunt');
  }
});
