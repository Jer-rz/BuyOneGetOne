# db/seeds.rb

# For example, to avoid duplicate:
products_data = [
  { code: "GR1", name: "Green Tea", price: 3.11 },
  { code: "SR1", name: "Strawberries", price: 5.00 },
  { code: "CF1", name: "Coffee", price: 11.23 }
]

products_data.each do |attributes|
  Product.find_or_create_by(code: attributes[:code]) do |product|
    product.name = attributes[:name]
    product.price = attributes[:price]
  end
end
