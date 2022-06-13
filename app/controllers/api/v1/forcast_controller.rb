class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location]
      forecast = ForecastFacade.forecast(params[:location])
      render json: ForecastSerializer.new(forecast)
    else
      render status: 404
  end
end
