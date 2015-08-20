def prepare_sample_data
  sample_data = File.read(File.expand_path('../../fixtures/sample_data.sql', __FILE__))
  client = Mysql2::Client.new(DB_CONFIG["bot_#{ENV['RAILS_ENV']}"])
  client.query(sample_data)
end
