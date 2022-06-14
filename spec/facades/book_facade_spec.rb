require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns book/weather info about a city' do
    data = BookFacade.book_search('denver,co',3)
    expect(data).to be_a(BookData)

    expect(data.destination).to eq('denver,co')
    expect(data.forecast).to be_a(CurrentAbridged)
    expect(data.total_books_found).to be_an(Integer)
    expect(data.books).to be_an(Array)
    expect(data.books.length).to eq(3)

      data.books.each do |book|
        expect(book).to be_a(Book)
      end
  end
end

# it is being narrowed down successfully to an array of 3 books,
# but not successfully being turned into a poro
