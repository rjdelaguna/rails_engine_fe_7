class ItemService
  def conn
    Faraday.new(url: 'http://localhost:3000/api/v1/')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def all_items
    get_url("items")
  end

  def merchant_items(id)
    get_url("merchants/#{id}/items")
  end

  def item(item_id)
    get_url("items/#{item_id}")
  end
end