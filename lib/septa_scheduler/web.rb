require 'sinatra'
require 'septa_stop_locator'

module SeptaScheduler
  class Web < Sinatra::Base
    get '/' do
      stops = SeptaStopLocator.find(
        params['lat'].to_f,
        params['lng'].to_f,
        params['route']
      )

      schedules = [schedule(stops[0], params['route']),
        schedule(stops[1], params['route'])]

      {
        inbound:  schedules.find { |sched| sched[0]['Direction'] == '1' },
        outbound: schedules.find { |sched| sched[0]['Direction'] != '1' }
      }.to_json
    end

    def schedule(stop, route)
      SeptaScheduler::Schedule
      .new(stop['stopid'], route)
      .get[route]
    end
  end
end
