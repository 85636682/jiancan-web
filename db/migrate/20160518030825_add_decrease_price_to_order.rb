class AddDecreasePriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :decrease_price, :decimal, default: 0
  end
end
