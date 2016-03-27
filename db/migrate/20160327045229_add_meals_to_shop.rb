class AddMealsToShop < ActiveRecord::Migration
  def change
    add_column :shops, :meals, :string
  end
end
