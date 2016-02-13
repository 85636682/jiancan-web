class AddLikedUsersToActivityUser < ActiveRecord::Migration
  def change
    add_column :activity_users, :liked_users, :integer, array: true

    add_index :activity_users, :liked_users, using: 'gin'
  end
end
