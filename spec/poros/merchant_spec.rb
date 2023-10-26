require 'rails_helper'

RSpec.describe Merchant, test: :model do
  it 'exists' do
    attrs = {
      id: 1,
      attributes: {name: 'Merchant'}
    }

    merchant = Merchant.new(attrs)

    expect(merchant).to be_a Merchant
    expect(merchant.id).to eq(1)
    expect(merchant.name).to eq('Merchant')
  end
end