class AddMerchantIdToMarketOrderMarketProduct < ActiveRecord::Migration
  def change
    add_column :market_order_market_products, :merchant_id, :integer
  end
end
