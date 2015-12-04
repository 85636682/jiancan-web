class AddPrivateTokenUpdateAtToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :private_token_updated_at, :datetime
  end
end
