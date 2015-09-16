class AddPrivateTokenToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :private_token, :string
  end
end
