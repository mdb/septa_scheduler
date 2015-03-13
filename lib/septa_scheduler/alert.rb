require 'septa_scheduler/concerns/http'

module SeptaScheduler
  class Alert
    include SeptaScheduler::Http

    def initialize(param)
      @uri = URI.parse("http://www3.septa.org/hackathon/Alerts/get_alert_data.php?req1=#{param}")

      puts @uri
    end

    def message
      @message ||= get['current_message']
    end

    private

    def get
      JSON.parse(do_get(@uri))[0]
    end
  end
end
