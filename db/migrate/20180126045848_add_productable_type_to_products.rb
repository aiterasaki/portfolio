class AddProductableTypeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :productable_type, :string
  end
end
