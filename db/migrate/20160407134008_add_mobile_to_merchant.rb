class AddMobileToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :mobile, :string
  end
end
