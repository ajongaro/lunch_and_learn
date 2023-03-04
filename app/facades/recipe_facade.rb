class RecipeFacade
  def self.get_recipes_for(country)
    recipes = RecipeService.get_recipes_for(country)
    
    recipes[:hits].map do |recipe|
      Recipe.new(recipe[:recipe], country)
    end
  end
end
