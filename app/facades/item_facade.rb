require_relative '../poros/item'

class ItemFacade

  def self.merchant_items(id)
    ItemService.new.merchant_items(id)[:data].map do |item|
      Item.new(item)
    end
  end

  def self.all_items
    ItemService.new.all_items[:data].map do |item|
      Item.new(item)
    end
  end

  def self.item(id)
    Item.new(ItemService.new.item(id)[:data])
  end
end