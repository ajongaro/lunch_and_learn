require 'rails_helper'

RSpec.describe PlacesService do
  describe 'Places API Calls' do
    it 'creates a connection', :vcr do
      attractions = PlacesService.tourist_attractions_for([40.4,-3.68])

      expect(attractions).to be_a(Hash)

      feature = attractions[:features].first[:properties]
      expect(feature).to have_key(:name)
      expect(feature).to have_key(:formatted)
      expect(feature).to have_key(:place_id)
    end
  end
end