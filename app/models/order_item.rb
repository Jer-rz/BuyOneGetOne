class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :check_for_discount


  def check_for_discount
    if self.quantity >= 3
      apply_special_discount
    else
      set_normal_price
    end
  end

  def set_normal_price
    self.price = product.price * self.quantity
  end

  def apply_special_discount
    case product.name
    when "Strawberries"
      apply_strawberry_discount
    when "Coffee"
      apply_coffee_discount
    end
  end

  def apply_strawberry_discount
    self.price = 4.50 * self.quantity
  end

  def apply_coffee_discount
    self.price = 7.49 * self.quantity
  end
end
