class AddFullFreeCourierToShops < ActiveRecord::Migration
  def change
    add_column :shops, :full_free_courier, :integer
  end
end
