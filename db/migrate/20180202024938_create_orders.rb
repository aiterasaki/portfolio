class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :method_of_payment
      t.string :first_name
      t.string :last_name
      t.string :postal_code
      t.integer :region_id
      t.string :address_city
      t.string :address_street
      t.string :address_building

      t.timestamps
    end
  end
end
