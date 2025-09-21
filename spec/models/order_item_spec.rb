require "rails_helper"

RSpec.describe OrderItem, type: :model do
  describe "associations" do
    it { should belong_to(:order) }
    it { should belong_to(:product) }
  end

  describe "callbacks" do
    let(:order) { create(:order) }

    context "when quantity is less than 3" do
      let(:product) { create(:product, name: "Coffee", price: 9.99) }
      let(:order_item) { create(:order_item, order:, product:, quantity: 2) }

      it "sets normal price as product price * quantity" do
        expect(order_item.price).to eq(9.99 * 2)
      end
    end

    context "when quantity is 3 or more and product is Strawberries" do
      let(:product) { create(:product, name: "Strawberries", price: 5.00) }
      let(:order_item) { create(:order_item, order:, product:, quantity: 3) }

      it "applies strawberry discount for all units" do
        expect(order_item.price).to eq(4.50 * 3)
      end
    end

    context "when quantity is 3 or more and product is Coffee" do
      let(:product) { create(:product, name: "Coffee", price: 11.23) }
      let(:order_item) { create(:order_item, order:, product:, quantity: 4) }

      it "applies coffee discount for all units" do
        expect(order_item.price).to eq(7.49 * 4)
      end
    end
  end
end
