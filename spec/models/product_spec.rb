require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
    it "is valid with valid attributes" do
      product = Product.new(name: "My Product", price: 100.0)
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      product = Product.new(name: nil, price: 100.0)
      expect(product).not_to be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is not valid without a price" do
      product = Product.new(name: "My Product", price: nil)
      expect(product).not_to be_valid
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is not valid if price is not a number" do
      product = Product.new(name: "My Product", price: "abc")
      expect(product).not_to be_valid
      expect(product.errors[:price]).to include("is not a number")
    end
  end
end
