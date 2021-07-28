require 'rails_helper'

RSpec.describe 'customer_subscriptions controller, create method' do
  before :each do
    @customer = create(:customer)
    @subscription = create(:subscription)
  end

  describe 'you can create a new customer subscription' do
    it 'returns email & api_key not password' do
      post "/api/v1/customer_subscriptions?customer_id=#{@customer.id}&subscription_id=#{@subscription.id}"
  
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.server_error?).to eq(false)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to be_a Hash
      expect(result).to have_key(:data)
      expect(result[:data]).to be_a Hash

      rdata = result[:data]
      expect(rdata).to have_key(:id)
      expect(rdata[:id]).to be_a String
      expect(rdata).to have_key(:type)
      expect(rdata[:type]).to eq('customer_subscription')
      expect(rdata).to have_key(:attributes)
      expect(rdata[:attributes]).to be_a Hash
      expect(rdata).to have_key(:relationships)
      expect(rdata[:relationships]).to be_a Hash
      
      expect(rdata[:attributes]).to have_key(:active)
      expect(rdata[:attributes][:active]).to eq(true)

      rcust = rdata[:relationships][:customer][:data]
      expect(rdata[:relationships]).to have_key :customer
      expect(rdata[:relationships][:customer]).to be_a Hash
      expect(rdata[:relationships][:customer]).to have_key :data
      expect(rcust).to be_a Hash
      expect(rcust).to have_key :id
      expect(rcust[:id]).to be_a String
      expect(rcust).to have_key :type
      expect(rcust[:type]).to be_a String

      rsub = rdata[:relationships][:subscription][:data]
      expect(rdata[:relationships]).to have_key :subscription
      expect(rdata[:relationships][:subscription]).to be_a Hash
      expect(rdata[:relationships][:subscription]).to have_key :data
      expect(rsub).to be_a Hash
      expect(rsub).to have_key :id
      expect(rsub[:id]).to be_a String
      expect(rsub).to have_key :type
      expect(rsub[:type]).to be_a String
    end
  end

  describe 'SAD Path' do
    it 'one param is missing' do
      post "/api/v1/customer_subscriptions?customer_id=#{@customer.id}"

      expect(response.status).to eq(400)
      expect(response.server_error?).to eq(false)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a Hash
      expect(error).to have_key :errors
      expect(error[:errors]).to eq('Existing customer ID and subscription ID must be present')
      expect(error).to have_key :status
      expect(error[:status]).to eq(400)
    end
  end
end