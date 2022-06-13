require 'rails_helper'

RSpec.describe Book do
  it 'makes a book poro with given data' do

    book_data = {isbn: ['123321','654456'], title: 'A Great Title', publisher: ['first publisher']}
    book_1 = Book.new(book_data)

    expect(book_1).to be_a(Book)
    expect(book_1.isbn).to be_an(Array)
    expect(book_1.title).to be_an(String)
    expect(book_1.publisher).to be_an(Array)
  end
end
