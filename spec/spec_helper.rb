$LOAD_PATH << '../lib'

require 'septa_scheduler'
require 'rack/test'
require 'vcr'

ENV['RACK_ENV'] = 'test'

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.hook_into                :webmock
  c.default_cassette_options = { record: :new_episodes }
end

RSpec.configure do |config|
  include Rack::Test::Methods

  config.extend VCR::RSpec::Macros

  def app
    SeptaScheduler::Web
  end
end
