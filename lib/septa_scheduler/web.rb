require 'sinatra'
require 'septa_stop_locator'
require 'tilt/jbuilder.rb'

module SeptaScheduler
  class Web < Sinatra::Base
    before do
      content_type 'application/json'
    end

    get '/' do
    end

    get '/point' do
      alert = SeptaScheduler::Alert.new(params['route'])

      stops = SeptaStopLocator.find(
        params['lat'].to_f,
        params['lng'].to_f,
        params['route']
      )

      schedules = schedules_from(stops, params['route'])

      template.render(nil, schedules: schedules, alert: alert)
    end

    get '/address' do
      alert = SeptaScheduler::Alert.new(params['route'])

      coordinates = SeptaScheduler::Geocoder.new(params['address']).coordinates

      stops = SeptaStopLocator.find(
        coordinates['lat'],
        coordinates['lng'],
        params['route']
      )

      schedules = schedules_from(stops, params['route'])

      template.render(nil, schedules: schedules, alert: alert)
    end

    def schedule(stop, route)
      SeptaScheduler::Schedule
        .new(stop['stopid'], route)
        .get[route]
    end

    def schedules_from(stops, route)
      stops.map { |stop| schedule(stop, route) }
    end

    def template
      view = File.expand_path('../views/scheduler.json.jbuilder', __FILE__)

      @template ||= Tilt::JbuilderTemplate.new(view)
    end
  end
end
