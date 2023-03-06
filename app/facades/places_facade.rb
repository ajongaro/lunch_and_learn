class PlacesFacade
  def self.tourist_sights_for(coordinates)
    sights = PlacesService.tourist_attractions_for(coordinates)

    sights[:hits].map do |sight|
      TouristSight.new(sight)
    end
  end
end
