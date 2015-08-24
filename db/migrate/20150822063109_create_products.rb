class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :avatar
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
