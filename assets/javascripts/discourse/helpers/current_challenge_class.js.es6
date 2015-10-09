Ember.Handlebars.registerBoundHelper("current_challenge_class", function(index, currentIndex, options) {
    return (index === currentIndex) ? "bg-color--primary-light" : "";
});
