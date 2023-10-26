require 'rails_helper'

RSpec.describe MerchantFacade, test: :model do
  describe 'class methods' do
    it '#merchant', :vcr do
      mf = MerchantFacade.merchant(1)

      expect(mf.id).to eq("1")
      expect(mf.name).to eq('Schroeder-Jerde')
      expect(mf).to be_a Merchant
    end

    it '#merchants', :vcr do
      mf = MerchantFacade.merchants

      expect(mf).to all be_a Merchant
      expect(mf[3]).to have_attributes(class: Merchant, id: "4", name: "Cummings-Thiel")
    end

    it '#search_merchants', :vcr do
      mf = MerchantFacade.search_merchants('Il')

      expect(mf).to all be_a Merchant
      expect(mf.count).to eq(8)
      expect(mf[2]).to have_attributes(class: Merchant, id: "20", name: "Schulist, Wilkinson and Leannon")
    end
  end
end