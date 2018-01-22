class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :brand
      t.text :detail
      t.integer :status
      t.integer :burden_of_shipping_fee
      t.integer :shipping_method
      t.integer :shipment_source_area
      t.integer :estimated_shipping_date
      t.integer :price
      t.boolean :sell_flg

      t.timestamps
    end
  end
end
