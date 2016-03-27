class AddMealsArrayToShop < ActiveRecord::Migration
  def change
    add_column :shops, :meals, :string, array: true

    add_index :shops, :meals, using: 'gin'
  end
end
