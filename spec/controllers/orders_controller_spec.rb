require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  let(:customer) { create(:customer) }
  let(:variant) { create(:variant) }



  describe "#create" do
    it "creates a new order" do
      expect {
        post :create, params: { order: FactoryBot.attributes_for(:order), variant_id: variant.id }
      }.to change(Order, :count).by(1)
      expect(response.status).to eq(201)
      data = JSON.parse(response.body)
      expect(data["id"]).to eq Order.last.id
    end
  end 


end
