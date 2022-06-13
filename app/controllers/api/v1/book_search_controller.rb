class Api::V1::BookSearchController < ApplicationController
  def index
    if params[:location]
      search_result = BookFacade.book_search(params[:location])
      render json: BookSerializer.new(search_result)
    else
      render status: 404
    end
  end
end
