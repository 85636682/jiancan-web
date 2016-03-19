class AddRemarksToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :remarks, :string
    add_column :orders, :meal_time, :datetime
    add_column :orders, :pay_method, :string
    add_column :orders, :address, :string
  end
end
