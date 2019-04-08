require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  let(:customer) { create(:customer) }
  let(:product) { create(:product) } 
  let(:variant) { create(:variant) }
  let(:variant2) { create(:variant, stock_amount: 0) }
  
  describe "#create" do
    it "creates a new order" do
      expect {
        post :create, params: { order: attributes_for(:order).merge(customer_id: customer.id, variant_ids: variant.id, status: "pending") }
      }.to change(Order, :count).by(1)
      expect(response.status).to eq(200)
      data = JSON.parse(response.body)
      expect(data["id"]).to eq Order.last.id
    end
    
    it "returns a 400 without required params" do
      expect {
        post :create, params: { order: attributes_for(:order).merge(customer_id: nil, variant_ids: nil) }
      }.to change(Order, :count).by(0)
      expect(response.status).to eq(400)
    end

    it "returns a 404 without valid customer and variant ids" do
      expect {
        post :create, params: { order: attributes_for(:order).merge(customer_id: 300, variant_ids: [500, 600, 700]) }
      }.to change(Order, :count).by(0)
      expect(response.status).to eq(404)
    end

    it "returns a 422 when variant is out of stock" do
      expect {
        post :create, params: { order: attributes_for(:order).merge(customer_id: customer.id, variant_ids: variant2.id) }
      }.to change(Order, :count).by(0)
      expect(response.status).to eq(422)
    end
  end
end
