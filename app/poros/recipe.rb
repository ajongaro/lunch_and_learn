class Recipe
  attr_reader :id, :type, :attributes
  def initialize(data, country)
    @id = nil 
    @type = 'recipe'
    @attributes = {
      "title": data[:label],
      "url": data[:uri],
      "country": country,
      "image": data[:image]
    }
  end
end