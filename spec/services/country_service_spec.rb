require 'rails_helper'

RSpec.describe CountryService do
  describe 'Countries API Calls' do
    it 'returns a random country', :vcr do
      country = CountryService.random_country

      expect(country).to be_a(String)
      expect(country).to_not eq("")
    end

    it 'returns lat and long of capital city', :vcr do
      coordinates = CountryService.capital_coordinates_for('france')

      expect(coordinates).to be_a(Array)
      expect(coordinates).to eq([48.87, 2.33])
   end
  end
end