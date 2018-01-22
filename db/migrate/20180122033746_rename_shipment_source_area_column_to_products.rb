class RenameShipmentSourceAreaColumnToProducts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :shipment_source_area, :region_id
  end
end
