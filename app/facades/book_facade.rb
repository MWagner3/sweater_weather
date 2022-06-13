class BookFacade
  class << self
    def book_search(location)
      coords   = MapQuestFacade.coords(location)
      forecast = ForecastService.get_weather(coords[:lat],coords[:lng])

      current  = Current.new(forecast[:current])


      destination = location
      forecast =
      total_books_found =
      books =



      BookData.new(destination, forecast, total_books_found, books)
    end
  end
end
