export default Discourse.BughuntRoute = Discourse.Route.extend({
  beforeModel() { return this.redirectIfLoginRequired(); },

  model: function() {
    return Discourse.ajax('/bughunt').then((result) => {
      return {
        challenges: result.challenges,
        data: _.map(result.data, (item) => {
          let [userName, ...contestResults] = item;
          return {userName, contestResults}
        })
      }
    });
  },

  setupController(controller, model) {
    controller.set('model', model);
    this.controllerFor('application').set('showFooter', true);
  }
});
