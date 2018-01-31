class CreateLadiesCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :ladies_categories do |t|
      t.string :name
      t.integer :category_id
      t.boolean :brand_flg

      t.timestamps
    end
  end
end
