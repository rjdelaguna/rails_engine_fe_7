class Item
  attr_reader :id, :name, :description, :unit_price

  def initialize(info)
    @id = info[:id]
    @name = info[:attributes][:name]
    @description = info[:attributes][:description]
    @unit_price = info[:attributes][:unit_price]
  end
end