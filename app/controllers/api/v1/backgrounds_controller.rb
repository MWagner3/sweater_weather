class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location]
      image = BackgroundFacade.image_data(params[:location])

      render json: ImageSerializer.new(image)
    else
      render status:404
    end
  end
end
