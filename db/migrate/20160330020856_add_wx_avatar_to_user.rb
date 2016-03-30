class AddWxAvatarToUser < ActiveRecord::Migration
  def change
    add_column :users, :wx_avatar, :string
  end
end
