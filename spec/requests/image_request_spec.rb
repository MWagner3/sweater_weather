require 'rails_helper'

RSpec.describe 'Image Requests' do
    it 'will return an image based on the query param' do
        get "/api/v1/backgrounds?location=denver,co"
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:data][:attributes]).to include(:image_url, :credit, :location)
    end
end
