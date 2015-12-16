class AddLocationToShop < ActiveRecord::Migration
  def change
    add_column :shops, :location, :st_point, :geographic => true
  end
end
