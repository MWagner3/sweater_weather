require 'rails_helper'

RSpec.describe 'Road Trip Requests' do
    describe 'happy path' do
        it 'will have all of the required attributes' do
            post "/api/v1/roadtrips", params: {"origin": "Boston,MA","destination": "Newport,OR", "api_key": "jgn983hy48thw9begh98h4539h4"}
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:data][:attributes]).to include(:start_city, :end_city, :travel_time, :weather_at_eta)
        end
    end
end
