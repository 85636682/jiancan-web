class AddIndexsToMerchant < ActiveRecord::Migration
  def change
    remove_index :merchants, :email
    add_index :merchants, :mobile
  end
end
