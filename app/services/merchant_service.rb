class MerchantService
  def conn
    Faraday.new(url: 'http://localhost:3000/api/v1/')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_merchants(query)
    get_url("merchants/find_all?name=#{query}")
  end

  def all_merchants
    get_url('merchants')
  end

  def merchant(merchant_id)
    get_url("merchants/#{merchant_id}")
  end
end