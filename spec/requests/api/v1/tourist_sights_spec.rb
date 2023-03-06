require 'rails_helper'

RSpec.describe 'Tourist Sights API Endpoint' do
  describe 'return tourist attractions within 20000 meters of capital' do
    it 'creates successful connection', :vcr do
      get '/api/v1/tourist_sights?country=spain'

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(parsed_response).to have_key(:data)
    end

    it 'has correct keys', :vcr do
      get '/api/v1/tourist_sights?country=france'

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      first_result = parsed_response[:data].first

      expect(first_result).to have_key(:id)
      expect(first_result).to have_key(:type)
      expect(first_result).to have_key(:attributes)
      expect(first_result[:attributes]).to have_key(:name)
      expect(first_result[:attributes]).to have_key(:address)
      expect(first_result[:attributes]).to have_key(:place_id)
    end

    it 'has correct information', :vcr do
      get '/api/v1/tourist_sights?country=spain'

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      first_result = parsed_response[:data].first

      expect(first_result[:id]).to eq(nil)
      expect(first_result[:type]).to eq('attraction')
      expect(first_result[:attributes]).to be_a(Hash)
      expect(first_result[:attributes][:name]).to eq('Templo de Debod')
      expect(first_result[:attributes][:address]).to eq('The Temple of Debod, Calle de Ferraz, 1, 28008 Madrid, Spain')
      expect(first_result[:attributes][:place_id]).to eq('5133fabcb202be0dc059a196bfd546364440f00101f901112862000000000092030f54656d706c6f206465204465626f64')
    end
  end
end