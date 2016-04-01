class AddExaminedToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :examined, :boolean, :default => false
  end
end
