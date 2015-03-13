module SeptaScheduler
  module Http
    def do_get(uri)
      Net::HTTP.get(uri)
    end
  end
end
