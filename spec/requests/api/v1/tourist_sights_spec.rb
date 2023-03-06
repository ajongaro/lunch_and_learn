require 'rails_helper'

RSpec.describe 'Tourist Sights API Endpoint' do
  describe 'return tourist attractions within 20000 meters of capital' do
    it 'creates successful connection', :vcr do
      get '/api/v1/tourist_sights?country=france'

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(parsed_response).to have_key(:data)
    end

    xit 'has correct keys', :vcr do
      get '/api/v1/recipes?country=france'

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      first_result = parsed_response[:data].first

      expect(first_result).to have_key(:id)
      expect(first_result).to have_key(:type)
      expect(first_result).to have_key(:attributes)
      expect(first_result[:attributes]).to have_key(:title)
      expect(first_result[:attributes]).to have_key(:url)
      expect(first_result[:attributes]).to have_key(:country)
      expect(first_result[:attributes]).to have_key(:image)
    end
  end
end