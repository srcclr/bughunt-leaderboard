export default Discourse.BughuntRoute = Discourse.Route.extend({
  beforeModel() { return this.redirectIfLoginRequired(); },

  model() {
    return Discourse.ajax('/bughunt');
  },

  setupController(controller, model) {
    controller.set('model', model);
    this.controllerFor('application').set('showFooter', true);
  }
});
