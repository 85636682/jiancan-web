class EditMealsArrayForShop < ActiveRecord::Migration
  def change
    change_column :shops, :meals, :string, array: true, default: []
  end
end
