class AddShopIdToFoodMaterial < ActiveRecord::Migration
  def change
    add_column :food_materials, :shop_id, :integer
  end
end
