require 'rails_helper'

RSpec.describe BookService do
  it 'can get data on books' do
    books_data = BookService.get_books('Denver,CO')

    expect(books_data).to be_a Hash
    expect(books_data[:docs]).to be_an Array
    expect(books_data[:numFound]).to be_an Integer

    book = books_data[:docs][0]

    expect(book).to have_key(:title)
    expect(book[:title]).to be_a String
    expect(book).to have_key(:isbn)
    expect(book[:isbn]).to be_an Array
    expect(book).to have_key(:publisher)
    expect(book[:publisher]).to be_an Array
  end
end
