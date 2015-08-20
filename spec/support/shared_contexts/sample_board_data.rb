shared_context 'sample board data' do
  sample_data = File.read(File.expand_path('../../../fixtures/sample_data.sql', __FILE__))
  client = Mysql2::Client.new(DB_CONFIG["bot_#{ENV['RAILS_ENV']}"])
  client.query(sample_data)
end
