class RecipesController < ApplicationController
  def index
    binding.pry
    # Get Country Param
    # If no country param, call REST Countries API to get random country
    # Call on the recipe API service to get all recipes from random country or query param
    # Serialize the response
  end
end