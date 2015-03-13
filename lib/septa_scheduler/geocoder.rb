require 'septa_scheduler/concerns/http'

module SeptaScheduler
  class Geocoder
    include SeptaScheduler::Http

    def initialize(address)
      address = "#{address}, Philadelphia, PA"

      @uri = URI.parse("https://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(address)}")
    end

    def coordinates
      @coordinates ||= geocode['results'][0]['geometry']['location']
    end

    private

    def geocode
      JSON.parse(do_get(@uri))
    end
  end
end
