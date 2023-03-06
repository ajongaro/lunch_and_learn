class CountryService
  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.random_country
    response = conn.get('/v3.1/all')
    parse(response).sample[:name][:common]
  end

  def self.capital_coordinates_for(country)
    response = conn.get("/v3.1/name/#{country}")
    parse(response).first[:capitalInfo][:latlng]
  end
  private_class_method :conn, :parse
end