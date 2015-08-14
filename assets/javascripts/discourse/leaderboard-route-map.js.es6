export default function() {
  this.resource('leaderboard', function() {
    this.route('boards', { path: '/' });
  });
}
