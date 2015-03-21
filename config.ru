$LOAD_PATH << './lib'

require 'septa_scheduler'
require 'rack/cors'

use Rack::Cors do

  # allow all origins in development
  allow do
    origins '*'
    resource '*',
      :headers => :any,
      :methods => [:get, :post, :delete, :put, :options]
  end
end

run SeptaScheduler::Web
