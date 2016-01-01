class RenameAddressToStreetWithShop < ActiveRecord::Migration
  def change
    rename_column :shops, :address, :street
  end
end
