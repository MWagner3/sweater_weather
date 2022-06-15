class RoadtripFacade
  class << self
    def build_roadtrip(origin, destination)


      start_city     = origin
      end_city       = destination
      
      travel_time    = MapQuestFacade.travel_time(origin, destination)
      weather_at_eta = ForecastFacade.forecast_eta(origin, destination)


      Roadtrip.new(start_city, end_city, travel_time, weather_at_eta)
    end
  end
end
