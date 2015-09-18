class AddMarketCategoryIdToMarketProduct < ActiveRecord::Migration
  def change
    add_column :market_products, :market_category_id, :integer
  end
end
