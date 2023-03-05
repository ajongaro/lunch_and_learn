class RecipeFacade
  def self.recipes_for(country)
    recipes = RecipeService.recipes_for(country)

    recipes[:hits].map do |recipe|
      Recipe.new(recipe[:recipe], country)
    end
  end
end
