class AddPrivateTokenUpdatedAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :private_token_updated_at, :datetime
  end
end
