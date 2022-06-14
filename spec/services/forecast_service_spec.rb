require 'rails_helper'

describe ForecastService do

  it 'can get the forecast for provided coordinates' do
    forecast_data = ForecastService.get_weather(38.309875, -77.466316)

    expect(forecast_data).to be_a(Hash)
    expect(forecast_data).to have_key(:lat)
    expect(forecast_data[:lat]).to be_a(Float)
    expect(forecast_data).to have_key(:lon)
    expect(forecast_data[:lon]).to be_a(Float)
    expect(forecast_data).to have_key(:current)
    expect(forecast_data[:current]).to be_a(Hash)
    expect(forecast_data).to have_key(:daily)
    expect(forecast_data[:daily]).to be_an(Array)
    expect(forecast_data).to have_key(:hourly)
    expect(forecast_data[:hourly]).to be_an(Array)

    expect(forecast_data).to_not have_key(:minutely)
    expect(forecast_data).to_not have_key(:alerts)

  end
end
