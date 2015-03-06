$LOAD_PATH << '../lib'

require 'septa_scheduler'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  include Rack::Test::Methods

  def app
    SeptaScheduler::Web
  end
end
