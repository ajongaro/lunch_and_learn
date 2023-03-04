require 'rails_helper'

RSpec.describe 'Recipes API Endpoints' do
  describe 'Get Recipes For A Particular Country' do
    it 'returns an an array under the data attribute' do
      get '/api/v1/recipes?country=france'
      
      expect(response).to be_successful
      expect(response[:data]).to be_an(Array)
    end
  end
end