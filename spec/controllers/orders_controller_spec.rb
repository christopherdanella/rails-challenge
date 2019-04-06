require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  let(:customer) { create(:customer) }
  let(:product) { create(:product) } 
  let(:variant) { create(:variant) }

  describe "#create" do
    it "creates a new order" do
      expect {
        post :create, params: { order: attributes_for(:order).merge(customer_id: customer.id, variant_ids: variant.id, status: "pending", total_cost: 400) }
      }.to change(Order, :count).by(1)
      expect(response.status).to eq(200)
      data = JSON.parse(response.body)
      expect(data["id"]).to eq Order.last.id
    end
    
    it "returns a 400 without required params" do
      expect {
        binding.pry
        post :create, params: { order: attributes_for(:order).merge(customer_id: nil, variant_ids: nil) }
      }.to change(Order, :count).by(0)
      expect(response.status).to eq(400)
    end
  end


end
