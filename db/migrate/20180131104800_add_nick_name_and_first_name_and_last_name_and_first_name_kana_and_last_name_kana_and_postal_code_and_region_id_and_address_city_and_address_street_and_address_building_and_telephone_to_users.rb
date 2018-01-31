class AddNickNameAndFirstNameAndLastNameAndFirstNameKanaAndLastNameKanaAndPostalCodeAndRegionIdAndAddressCityAndAddressStreetAndAddressBuildingAndTelephoneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nick_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :postal_code, :string
    add_column :users, :region_id, :integer
    add_column :users, :address_city, :string
    add_column :users, :address_street, :string
    add_column :users, :address_building, :string
    add_column :users, :telephone, :string
  end
end
