class BookFacade
  class << self
    def book_search(location, quantity)
      coords   = MapQuestFacade.coords(location)
      weather = ForecastService.get_weather(coords[:lat],coords[:lng])
      current  = CurrentAbridged.new(weather[:current])

      #attributes for poro start here
      destination = location
      forecast = current
      total_books_found = BookService.get_books(location)[:numFound]
      books = BookService.get_books(location)[:docs][0..(quantity - 1)].each do |book|
        Book.new(book)
      end

      BookData.new(destination, forecast, total_books_found, books)
    end
  end
end
