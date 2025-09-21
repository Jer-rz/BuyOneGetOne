require "rails_helper"

RSpec.describe Order, type: :model do
  describe "associations" do
    it { should have_many(:order_items).dependent(:destroy) }
    it { should have_many(:products).through(:order_items) }
  end

  describe "nested attributes" do
    it { should accept_nested_attributes_for(:order_items) }
  end

  describe "#total_price" do
    let(:order) { create(:order) }
    let(:product1) { create(:product, price: 5.0) }
    let(:product2) { create(:product, price: 10.0) }

    before do
      create(:order_item, order:, product: product1, quantity: 1)
      create(:order_item, order:, product: product2, quantity: 2)
    end

    it "returns the sum of all order_items prices" do
      expect(order.total_price).to eq(25)
    end
  end
end
