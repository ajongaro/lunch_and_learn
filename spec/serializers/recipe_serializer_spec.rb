require 'rails_helper'

RSpec.describe RecipeSerializer do
  describe 'serialize recipe response' do
    it 'cleans response', :vcr do
      recipes = RecipeFacade.get_recipes_for('france')
      serialized_recipes = RecipeSerializer.new(recipes)

      expect(serialized_recipes).to be_a(RecipeSerializer)
    end
  end
end