class CreateFoodMaterials < ActiveRecord::Migration
  def change
    create_table :food_materials do |t|
      t.string :name
      t.string :avatar
      t.integer :stock_balance
      t.integer :minimum_stock
      t.integer :maximum_stock

      t.timestamps null: false
    end
  end
end
