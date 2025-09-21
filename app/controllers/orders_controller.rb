class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]
  def create
    order = Order.new(order_params)

    if order.save
      render json: order.as_json(
      include: { order_items: { only: [ :id, :product_id, :quantity, :price ] } },
      methods: :total_price
    ), status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    orders = Order.all
    render json: orders.as_json(methods: :total_price)
  end

  private

  def order_params
    params.require(:order).permit(
      :customer_name,
      order_items_attributes: [ :product_id, :quantity ]
    )
  end
end
