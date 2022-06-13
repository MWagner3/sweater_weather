class MapQuestFacade
  class << self
    def forcast(location)
      coords  = MaMapQuestFacade.coords(location)
      forcast = ForecastService.get_weather(coords[:lat],coords[:lng])

      current = Current.new(forcast[:current])

      daily   = forcast[:daily][0..4].each do |day|
        Daily.new(day)
      end
      
      hourly  = forcast[:hourly][0..8].each do |hour|
        Hourly.new(hour)
      end

      Forcast.new(current, daily, hourly)
    end
  end
end
