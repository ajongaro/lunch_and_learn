require 'rails_helper'

RSpec.describe 'Recipes API Endpoints' do
  describe 'Get Recipes For A Particular Country' do
    it 'creates successful connection', :vcr do
      get '/api/v1/recipes?country=france'

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(parsed_response).to have_key(:data)
    end

    it 'has correct keys', :vcr do
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

    it 'cleans data correctly', :vcr do
      get '/api/v1/recipes?country=france'

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      first_result = parsed_response[:data].first

      expect(first_result[:attributes]).to_not have_key(:source)
      expect(first_result[:attributes]).to_not have_key(:share_as)
      expect(first_result[:attributes]).to_not have_key(:yield)
    end
  end
end
