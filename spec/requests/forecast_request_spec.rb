require 'rails_helper'

RSpec.describe 'Forecast Requests' do
    describe 'it will retrieve weather for a city' do
        it 'will return lat and long of a city' do
            result = MapQuestService.get_coords_from_location('Denver,Co')
            expect(result[:lat]).to eq(39.738453)
            expect(result[:lng]).to eq(-104.984853)
        end
        it 'will return the current weather for a city from lat and lon' do
            get "/api/v1/forecast?location=denver,co"
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:data][:type]).to eq('forecast')
            expect(response_info[:data][:attributes]).to include(:daily_weather, :hourly_weather, :current_weather)
            expect(response_info[:data][:attributes]).to_not include(:alerts)
        end
    end
end
