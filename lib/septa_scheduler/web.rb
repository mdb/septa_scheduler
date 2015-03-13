require 'sinatra'
require 'septa_stop_locator'

module SeptaScheduler
  class Web < Sinatra::Base
    get '/' do
    end

    get '/point' do
      stops = SeptaStopLocator.find(
        params['lat'].to_f,
        params['lng'].to_f,
        params['route']
      )

      schedules = schedules_from(stops, params['route'])

      {
        inbound:  schedules.find { |sched| sched[0]['Direction'] == '1' },
        outbound: schedules.find { |sched| sched[0]['Direction'] != '1' }
      }.to_json
    end

    get '/address' do
      coordinates = SeptaScheduler::Geocoder.new(params['address']).coordinates

      stops = SeptaStopLocator.find(
        coordinates['lat'],
        coordinates['lng'],
        params['route']
      )

      schedules = schedules_from(stops, params['route'])

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

    def schedules_from(stops, route)
      [schedule(stops[0], route),
       schedule(stops[1], route)]
    end
  end
end
