require 'rails_helper'

RSpec.describe RecipeService do
  describe 'EDAMAM API Calls' do
    it 'creates a connection', :vcr do
      recipes = RecipeService.recipes_for('france')

      expect(recipes).to be_a(Hash)
    end
  end
end