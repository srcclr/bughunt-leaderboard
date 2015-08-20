ENV["RAILS_ENV"] = "test"

require "spec_helper"
require "rspec/rails"

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end
