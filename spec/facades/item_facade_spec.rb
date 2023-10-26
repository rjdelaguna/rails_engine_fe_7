require 'rails_helper'

RSpec.describe ItemFacade, test: :model do
  describe 'class methods' do
    it '#item', :vcr do
      itemf = ItemFacade.item(5)

      expect(itemf.id).to eq('5')
      expect(itemf.name).to eq('Item Expedita Aliquam')
      expect(itemf.description).to eq('Voluptate aut labore qui illum tempore eius. Corrupti cum et rerum. Enim illum labore voluptatem dicta consequatur. Consequatur sunt consequuntur ut officiis.')
      expect(itemf.unit_price).to eq(687.23)
    end

    it '#all_items', :vcr do
      itemf = ItemFacade.all_items

      expect(itemf).to all be_a Item
      expect(itemf[3].id).to eq("7")
      expect(itemf[3].name).to eq("Item Expedita Fuga")
      expect(itemf[3].description).to eq('Fuga assumenda occaecati hic dolorem tenetur dolores nisi. Est tenetur adipisci voluptatem vel. Culpa adipisci consequatur illo. Necessitatibus quis quo velit sed repellendus ut amet.')
      expect(itemf[3].unit_price).to eq(311.63)
    end

    it '#merchant_items', :vcr do
      mi = ItemFacade.merchant_items(3)

      expect(mi).to all be_a Item
      expect(mi.count).to eq(25)
      expect(mi[3].id).to eq("57")
      expect(mi[3].name).to eq("Item Et Reiciendis")
      expect(mi[3].description).to eq('In qui eveniet itaque et et vel. Iusto sunt facere ex et enim porro expedita. At dolore ab perferendis ex. Dolor debitis illum nulla.')
      expect(mi[3].unit_price).to eq(415.48)
    end
  end
end