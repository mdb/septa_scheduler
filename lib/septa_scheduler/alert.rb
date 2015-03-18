require 'septa_scheduler/concerns/http'

module SeptaScheduler
  class Alert
    include SeptaScheduler::Http

    TROLLEY_ROUTES = ['10', '11', '13', '15', '34', '36']

    def initialize(route_id)
      @uri = URI.parse("http://www3.septa.org/hackathon/Alerts/get_alert_data.php?req1=#{route_param(route_id)}")
    end

    def advisory_message
      get['advisory_message']
    end

    def current_message
      get['current_message']
    end

    def detour_message
      get['detour_message']
    end

    def detour_reason
      get['detour_reason']
    end

    def detour_start_location
      get['detour_start_location']
    end

    def detour_start_time
      get['detour_start_date_time']
    end

    def detour_end_time
      get['detour_end_date_time']
    end

    def last_updated
      get['last_updated']
    end

    def snow?
      get['isSnow'] == 'Y'
    end

    def to_hash
      get
    end

    private

    def get
      @get ||= JSON.parse(do_get(@uri))[0]
    end

    def route_param(route_id)
      transit_type = TROLLEY_ROUTES.include?(route_id) ? 'trolley' : 'bus'

      "#{transit_type}_route_#{route_id}"
    end
  end
end
