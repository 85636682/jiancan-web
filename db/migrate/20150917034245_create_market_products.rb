class CreateMarketProducts < ActiveRecord::Migration
  def change
    create_table :market_products do |t|
      t.string :name
      t.decimal :price
      t.string :avatar

      t.timestamps null: false
    end
  end
end
