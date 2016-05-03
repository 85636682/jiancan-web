class AddOrdersCountToShop < ActiveRecord::Migration
  def change
    add_column :shops, :orders_count, :integer, default: 0

    Shop.reset_column_information
    Shop.find_each do |s|
      Shop.reset_counters s.id, :orders
    end
  end
end
