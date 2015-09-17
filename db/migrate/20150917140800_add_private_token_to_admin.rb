class AddPrivateTokenToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :private_token, :string
  end
end
