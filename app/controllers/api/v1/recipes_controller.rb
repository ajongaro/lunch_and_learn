class Api::V1::RecipesController < ApplicationController
  def index
    if recipe_params[:country] == ''
      {
        "data": []
      }
    elsif recipe_params[:country]
      recipes = RecipeFacade.recipes_for(recipe_params[:country])
      render json: RecipeSerializer.new(recipes).serializable_hash
    else
      country = CountryService.random_country
      recipes = RecipeFacade.recipes_for(country)
      render json: RecipeSerializer.new(recipes).serializable_hash
    end
  end

  private

  def recipe_params
    params.permit(:country)
  end
end