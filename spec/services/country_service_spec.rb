require 'rails_helper'

RSpec.describe CountryService do
  describe 'Countries API Calls' do
    it 'returns a random country', :vcr do
      country = CountryService.random_country

      expect(country).to be_a(String)
    end
  end
end