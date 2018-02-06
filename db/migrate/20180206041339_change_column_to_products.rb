class ChangeColumnToProducts < ActiveRecord::Migration[5.1]
    # 変更内容
  def up
    change_column :products, :sell_flg, :boolean, default: true, null: false
  end

  # 変更前の状態
  def down
    change_column :products, :sell_flg, :boolean
  end

end