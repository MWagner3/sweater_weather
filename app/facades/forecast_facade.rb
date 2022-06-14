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
  end
end
