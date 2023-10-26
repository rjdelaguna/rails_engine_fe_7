require 'rails_helper'

RSpec.describe Item, test: :model do
  it 'exists' do
    attrs = {
              id: 1,
              attributes: {
                            name: 'Item',
                            description: 'A thing',
                            unit_price: 6.97
                          }
            }

    item = Item.new(attrs)

    expect(item).to be_a Item
    expect(item.id).to eq(1)
    expect(item.name).to eq('Item')
    expect(item.description).to eq('A thing')
    expect(item.unit_price).to eq(6.97)
  end
end