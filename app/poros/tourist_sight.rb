
class TouristSight
  attr_reader :id, :type, :name, :address, :place_id

  def initialize(data)
    properties = data[:properties]
    @id = nil 
    @type = 'tourist_sight'
    @name = properties[:name]
    @address = properties[:formatted]
    @place_id = properties[:place_id] 
  end
end