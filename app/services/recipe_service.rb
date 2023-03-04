class RecipeService
  def self.conn
    Faraday.new(url: 'https://api.edamam.com/api/recipes/v2')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_recipes_for(country)
    response = conn.get('/search') do |req|
      req.params['q'] = country
      req.params['app_id'] = ENV['EDAMAM_APP_ID']
      req.params['app_key'] = ENV['EDAMAM_APP_KEY']
    end
    parse(response)
  end

  private_class_method :conn, :parse
end