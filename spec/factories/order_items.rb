FactoryBot.define do
  factory :order_item do
    association :order
    association :product
    quantity { 1 }
    price { product.price * quantity } # will be overridden by callback anyway
  end
end
