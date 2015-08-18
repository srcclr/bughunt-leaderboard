export default function() {
  this.resource('leaderboard', function() {
    this.route('leaderboard', { path: '/' });
  });
}
