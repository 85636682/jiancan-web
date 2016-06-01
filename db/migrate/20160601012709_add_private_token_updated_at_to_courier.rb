class AddPrivateTokenUpdatedAtToCourier < ActiveRecord::Migration
  def change
    add_column :couriers, :private_token_updated_at, :datetime
  end
end
