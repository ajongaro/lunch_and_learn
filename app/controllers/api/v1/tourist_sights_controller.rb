
class Api::V1::TouristSightsController < ApplicationController
  def index
    # get lat/long of capital city of country from countries API
    coordinates = CountryService.capital_coordinates_for(params[:country])
    # search for tourist attractions within 20000 of capital city coordinates
    attractions = PlacesFacade.tourist_sights_for(coordinates) 
    render json: AttractionSerializer.new(attractions)
  end
end