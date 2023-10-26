require 'rails_helper'

RSpec.describe MerchantService do
  it 'exists' do
    ms = MerchantService.new
    expect(ms).to be_a MerchantService
  end

  context 'class methods' do
    context '#all_merchants', :vcr do
      it 'connects all merchants endpoint to the base api url' do
        service = MerchantService.new
        results = service.all_merchants

        expect(results).to be_a Hash
        expect(results[:data]).to be_an Array
        expect(results[:data].count).to eq(100)
        expect(results[:data][0][:id]).to be_an String
        expect(results[:data][0][:type]).to be_a String
        expect(results[:data][0][:attributes]).to be_a Hash
        expect(results[:data][0][:attributes][:name]).to be_a String
      end
    end

    context '#merchant', :vcr do
      it 'connects a merchant endpoint to the base api url' do
        service = MerchantService.new
        results = service.merchant(1)

        expect(results).to be_a Hash
        expect(results[:data]).to be_an Hash
        expect(results[:data][:id]).to be_an String
        expect(results[:data][:type]).to be_a String
        expect(results[:data][:attributes]).to be_a Hash
        expect(results[:data][:attributes][:name]).to be_a String
      end
    end

    context '#search_merchants', :vcr do
      it 'connects merchants matching search query endpoint to the base api url' do
        service = MerchantService.new
        results = service.search_merchants("on")

        expect(results).to be_a Hash
        expect(results[:data]).to be_an Array
        expect(results[:data][0][:id]).to be_an String
        expect(results[:data][0][:type]).to be_a String
        expect(results[:data][0][:attributes]).to be_a Hash
        expect(results[:data][0][:attributes][:name]).to be_a String
      end
    end
  end
end