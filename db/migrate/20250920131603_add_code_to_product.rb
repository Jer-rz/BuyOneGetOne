class AddCodeToProduct < ActiveRecord::Migration[8.0]
  def change
      add_column :products, :code, :string
  end
end
