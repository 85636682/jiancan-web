class AddDefaultedToReceivingAddress < ActiveRecord::Migration
  def change
    add_column :receiving_addresses, :defaulted, :boolean, default: false
  end
end
