class BookFacade
  class << self
    def book_search(location)
      coords   = MapQuestFacade.coords(location)
      weather = ForecastService.get_weather(coords[:lat],coords[:lng])
      current  = CurrentAbridged.new(weather[:current])


      destination = location
      forecast = current
      total_books_found = BookService.get_books(location)[:numFound]
      books = BookService.get_books(location)[:docs].each do |book|
        Book.new(book)
      end



      BookData.new(destination, forecast, total_books_found, books)
    end
  end
end
