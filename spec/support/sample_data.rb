def prepare_sample_data
  sample_data = File.read(File.expand_path('../../fixtures/sample_data.sql', __FILE__))
  Leaderboard::Connection.query(sample_data)
end
