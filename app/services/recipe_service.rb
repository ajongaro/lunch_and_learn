class RecipeService
  def self.conn
    Faraday.new(url: 'https://api.edamam.com/') do |req|
      req.params['type'] = 'public'
      req.params['app_id'] = ENV['EDAMAM_APP_ID']
      req.params['app_key'] = ENV['EDAMAM_APP_KEY']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.recipes_for(country)
    response = conn.get('api/recipes/v2/') do |req|
      req.params['q'] = country
    end
    parse(response)
  end

  private_class_method :conn, :parse
end