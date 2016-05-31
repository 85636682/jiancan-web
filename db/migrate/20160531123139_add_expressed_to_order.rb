class AddExpressedToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :expressed, :boolean, default: false
  end
end
