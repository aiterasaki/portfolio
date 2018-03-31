class AddAdminFlgToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :admin_flg, :boolean, default: true, null: false
  end
end
