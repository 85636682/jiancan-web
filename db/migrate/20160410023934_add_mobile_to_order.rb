class AddMobileToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :mobile, :string
  end
end
