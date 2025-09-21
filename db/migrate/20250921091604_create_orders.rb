class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.timestamps
      t.string :customer_name
    end
  end
end
