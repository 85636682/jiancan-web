class AddPrivateTokenUpdatedAtToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :private_token_updated_at, :datetime
  end
end
