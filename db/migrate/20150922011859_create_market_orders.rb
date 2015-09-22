class CreateMarketOrders < ActiveRecord::Migration
  def change
    create_table :market_orders do |t|
      t.string :sn
      t.integer :merchant_id
      t.integer :shop_id
      t.decimal :total_price

      t.timestamps null: false
    end
  end
end
