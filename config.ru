$LOAD_PATH << './lib'

require 'septa_scheduler'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get, :options]
  end
end

run SeptaScheduler::Web
