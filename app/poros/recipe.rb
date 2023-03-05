class Recipe
  attr_reader :id, :type, :title, :url, :country, :image

  def initialize(data, country)
    @id = nil 
    @type = 'recipe'
    @title = data[:label]
    @url = data[:uri]
    @country = country 
    @image = data[:image] 
  end
end