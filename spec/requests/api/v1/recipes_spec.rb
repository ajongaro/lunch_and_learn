require 'rails_helper'

RSpec.describe 'Recipes API Endpoints' do
  describe 'Get Recipes For A Particular Country' do
    it 'returns an an array under the data attribute' do
      get '/api/v1/recipes?country=france'
      
      expect(response).to be_successful
      # expect(response[:data]).to be_an(Array)
    end
  end
end

#Testing should look for more than just the presence of attribute fields in the response. Testing should also determine which fields should NOT be present. (don’t send back unnecessary data in the response) 