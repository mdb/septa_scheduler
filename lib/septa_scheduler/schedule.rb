require 'septa_scheduler/concerns/http'

module SeptaScheduler
  class Schedule
    include SeptaScheduler::Http

    def initialize(stop_id, route)
      @uri = URI.parse("http://www3.septa.org/hackathon/BusSchedules/?req1=#{stop_id}&req2=#{route}")
    end

    def get
      @schedule ||= get_schedule
    end

    private

    def get_schedule
      JSON.parse(do_get(@uri))
    end
  end
end
