require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET #index" do
    before do
      product = create(:product, price: 10)
      order = create(:order, customer_name: "Alice")
      create(:order_item, order: order, product: product, quantity: 2)
      get :index
    end

    it "returns all orders with total_price" do
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    let(:product1) { create(:product, price: 5) }
    let(:product2) { create(:product, price: 7) }

    it "creates an order with items and returns total_price" do
      post :create, params: {
        order: {
          customer_name: "Bob",
          order_items_attributes: [
            { product_id: product1.id, quantity: 2 },
            { product_id: product2.id, quantity: 1 }
          ]
        }
      }

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["customer_name"]).to eq("Bob")
      expect(json["order_items"].size).to eq(2)
      expect(json["total_price"]).to eq("17.0") # 2*5 + 1*7
    end
  end
end
