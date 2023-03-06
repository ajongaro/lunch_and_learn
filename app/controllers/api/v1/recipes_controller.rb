class Api::V1::RecipesController < ApplicationController
  def index
    return recipes_from_random_country unless params[:country]
    return no_data if no_country?

    return_recipes(searched_recipes_response)
  end

  private

  def no_country?
    params[:country].strip == ''
  end

  def no_data
    render json: { "data": [] }
  end

  def return_recipes(recipes)
    return no_data if recipes.nil?

    recipes
  end

  def searched_recipes_response
    recipes = RecipeFacade.recipes_for(params[:country])
    render json: RecipeSerializer.new(recipes)
  end

  def recipes_from_random_country
    country = CountryService.random_country
    recipes = RecipeFacade.recipes_for(country)
    render json: RecipeSerializer.new(recipes)
  end
end