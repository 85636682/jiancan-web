class AddCollectToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :collect, :decimal
  end
end
