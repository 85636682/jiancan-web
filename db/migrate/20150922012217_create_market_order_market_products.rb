class CreateMarketOrderMarketProducts < ActiveRecord::Migration
  def change
    create_table :market_order_market_products do |t|
      t.integer :market_order_id
      t.integer :market_product_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
