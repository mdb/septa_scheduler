require 'faraday'

module SeptaScheduler
  class Geocoder
    def initialize(address)
      address = "#{address}, Philadelphia, PA"

      @uri = "https://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(address)}"
    end

    def coordinates
      @coordinates ||= geocode['results'][0]['geometry']['location']
    end

    private

    def geocode
      JSON.parse(get.body)
    end

    def get
      Faraday.get(@uri)
    end
  end
end
