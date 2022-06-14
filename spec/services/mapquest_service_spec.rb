require 'rails_helper'

describe MapQuestService do

  it 'can get location info (coordinates)' do
    location_data = MapQuestService.get_coords_from_location('Fredericksburg,VA')

    expect(location_data).to be_a(Hash)
    expect(location_data).to have_key(:lat)
    expect(location_data).to have_key(:lng)
  end
end
