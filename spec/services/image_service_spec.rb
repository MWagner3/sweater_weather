require 'rails_helper'

RSpec.describe ImageService do
    it 'will return the necessary JSON attributes' do
        data = ImageService.get_image('fredericksburg')[:results].first
        expect(data).to include(:urls, :user)
    end
end
