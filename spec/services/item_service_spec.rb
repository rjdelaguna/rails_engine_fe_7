require 'rails_helper'

RSpec.describe ItemService do
  it 'exists' do
    item_s = ItemService.new
    expect(item_s).to be_a ItemService
  end

  context 'class methods' do
    context '#all_items', :vcr do
      it 'connects all items endpoint to the base api url' do
        service = ItemService.new
        results = service.all_items

        expect(results).to be_a Hash
        expect(results[:data]).to be_an Array
        expect(results[:data].count).to eq(2487)
        expect(results[:data][0][:id]).to be_an String
        expect(results[:data][0][:type]).to be_a String
        expect(results[:data][0][:attributes]).to be_a Hash
        expect(results[:data][0][:attributes][:name]).to be_a String
        expect(results[:data][0][:attributes][:description]).to be_a String
        expect(results[:data][0][:attributes][:unit_price]).to be_a Float
        expect(results[:data][0][:attributes][:merchant_id]).to be_a Integer
      end
    end

    context '#item', :vcr do
      it 'connects a item endpoint to the base api url' do
        service = ItemService.new
        results = service.item(4)

        expect(results).to be_a Hash
        expect(results[:data]).to be_an Hash
        expect(results[:data][:id]).to be_an String
        expect(results[:data][:type]).to be_a String
        expect(results[:data][:attributes]).to be_a Hash
        expect(results[:data][:attributes][:name]).to be_a String
        expect(results[:data][:attributes][:description]).to be_a String
        expect(results[:data][:attributes][:unit_price]).to be_a Float
        expect(results[:data][:attributes][:merchant_id]).to be_a Integer
      end
    end

    context '#merchant_items', :vcr do
      it 'connects a merchants items endpoint to the base api url' do
        service = ItemService.new
        results = service.merchant_items(1)

        expect(results).to be_a Hash
        expect(results[:data]).to be_an Array
        expect(results[:data][0][:id]).to be_an String
        expect(results[:data][0][:type]).to be_a String
        expect(results[:data][0][:attributes]).to be_a Hash
        expect(results[:data][0][:attributes][:name]).to be_a String
        expect(results[:data][0][:attributes][:description]).to be_a String
        expect(results[:data][0][:attributes][:unit_price]).to be_a Float
        expect(results[:data][0][:attributes][:merchant_id]).to be_a Integer
      end
    end
  end
end