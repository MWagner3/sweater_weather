class ForecastFacade
  class << self
    def forecast(location)
      coords   = MapQuestFacade.coords(location)
      forecast = ForecastService.get_weather(coords[:lat],coords[:lng])

      current  = Current.new(forecast[:current])

      daily    = forecast[:daily][0..4].map do |day|
        Daily.new(day)
      end

      hourly   = forecast[:hourly][0..7].map do |hour|
        Hourly.new(hour)
      end

      Forecast.new(current, daily, hourly)
    end

    def arrival_hour_weather(location, hour)
      coords   = MapQuestFacade.coords(location)
      hour_forecast = ForecastService.get_weather(coords[:lat],coords[:lng])[:hourly][hour]
    end

    def forecast_eta(origin, destination)
     travel_time = MapQuestFacade.travel_time(origin, destination)
     arrival = travel_time.to_i.round - 1
     arrival_hour = arrival_hour_weather(destination, arrival)
     Hourly.new(arrival_hour)
   end
  end
end
