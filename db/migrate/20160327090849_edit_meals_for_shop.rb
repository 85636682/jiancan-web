class EditMealsForShop < ActiveRecord::Migration
  def change
    remove_column :shops, :meals
  end
end
