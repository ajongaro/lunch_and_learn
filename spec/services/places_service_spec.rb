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

    it 'returns an attraction', :vcr do
      attractions = PlacesService.tourist_attractions_for([40.4,-3.68])

      expect(attractions).to be_a(Hash)

      feature = attractions[:features].first[:properties]
      expect(feature[:name]).to eq("Templo de Debod")
      expect(feature[:formatted]).to eq("The Temple of Debod, Calle de Ferraz, 1, 28008 Madrid, Spain")
      expect(feature[:place_id]).to eq("5133fabcb202be0dc059a196bfd546364440f00101f901112862000000000092030f54656d706c6f206465204465626f64")
    end
  end
end