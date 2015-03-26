$LOAD_PATH << '../lib'

require 'septa_scheduler'
require 'rack/test'
require 'vcr'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  include Rack::Test::Methods

  #config.extend VCR::RSpec::Macros

  def app
    SeptaScheduler::Web
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.configure_rspec_metadata!
  c.hook_into :webmock
end
