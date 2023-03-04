class Api::V1::RecipesController < ApplicationController
  def index
    if recipe_params[:country] == ''
      {
        "data": []
      } 
    elsif recipe_params[:country]
      recipes = RecipeFacade.get_recipes_for(recipe_params[:country])
      render json: RecipeSerializer.new(recipes)
    else
      # If no country param, call REST Countries API to get random country
      # Call on the recipe API service to get all recipes from random country
      # Serialize the response
    end
  end

  private

  def recipe_params
    params.permit(:country)
  end
end