class DropTables < ActiveRecord::Migration
  def change
    drop_table :add_bonus_cleared_to_user_cards
    drop_table :add_private_token_update_at_to_workers
    drop_table :market_categories
    drop_table :market_order_market_products
    drop_table :market_orders
    drop_table :market_products
  end
end
