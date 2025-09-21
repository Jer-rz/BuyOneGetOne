require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    before do
      create(:product, name: "Coffee", price: 9.99)
      create(:product, name: "Strawberries", price: 5.99)
      get :index
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "returns all products in JSON" do
      json = JSON.parse(response.body)
      expect(json["products"].size).to eq(2)
      expect(json["products"].map { |p| p["name"] }).to include("Coffee", "Strawberries")
    end
  end
end
