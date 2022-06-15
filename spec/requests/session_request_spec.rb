require 'rails_helper'

RSpec.describe 'Session Requests' do
  describe 'post api/v1/sessions' do
    it 'returns user data' do
      user = User.create(email: 'test@gmail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')
      user_params = {
                      email: 'pesto@fakeemail.com',
                      password: "password123",
                    }
      post '/api/v1/sessions', params: user_params

      expect(user.email).to eq('test@gmail.com')
      expect(user.api_key).not_to eq(nil)
    end
  end
end
