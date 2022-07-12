class AddUnitpriceToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :unit_price, :float
  end
end
