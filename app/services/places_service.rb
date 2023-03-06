class PlacesService
  def self.conn
    Faraday.new(url: 'https://api.geoapify.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.tourist_attractions_for(latlng)
    response = conn.get("/v2/places/?filter=circle:#{latlng[1]},#{latlng[0]},20000&apiKey=#{ENV['PLACES_KEY']}&categories=tourism.sights")
    parse(response)
  end

  private_class_method :conn, :parse
end
