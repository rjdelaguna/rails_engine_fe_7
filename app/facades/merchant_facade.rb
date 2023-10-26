require_relative '../poros/merchant'

class MerchantFacade

  def self.merchants
    MerchantService.new.all_merchants[:data].map do |merchant|
      Merchant.new(merchant)
    end
  end

  def self.merchant(id)
    Merchant.new(MerchantService.new.merchant(id)[:data])
  end

  def self.search_merchants(query)
    MerchantService.new.search_merchants(query)[:data].map do |merchant|
      Merchant.new(merchant)
    end
  end
end