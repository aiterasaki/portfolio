class ProductOrders < ActiveRecord::Migration[5.1]
  def change
  	    drop_table :product_orders
  end
end
