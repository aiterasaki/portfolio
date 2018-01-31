class AddProductableIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :productable_id, :integer
  end
end
