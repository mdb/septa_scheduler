module SeptaScheduler
  class Schedule
    def initialize(stop_id, route)
      @uri ||= URI.parse("http://www3.septa.org/hackathon/BusSchedules/?req1=#{stop_id}&req2=#{route}")
    end

    def get
      @schedule ||= JSON.parse(get_schedule)
    end

    private

    def request
      Net::HTTP::Get.new(@uri.request_uri)
    end

    def get_schedule
      http = Net::HTTP.new(@uri.host, @uri.port)

      http.request(request).body
    end
  end
end
