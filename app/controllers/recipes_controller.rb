class RecipesController < ApplicationController
  def index
    if recipe_params
      # Call on the recipe API service to get all recipes from query param
      # Serialize the response
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