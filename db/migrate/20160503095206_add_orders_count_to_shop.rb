class AddOrdersCountToShop < ActiveRecord::Migration
  def change
    add_column :shops, :orders_count, :integer, default: 0

    Shop.reset_column_information
    Shop.all.each do |s|
      s.update_attribute :orders_count, s.orders.length  
    end
  end
end
