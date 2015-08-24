class AddPrivateTokenToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :private_token, :string
  end
end
