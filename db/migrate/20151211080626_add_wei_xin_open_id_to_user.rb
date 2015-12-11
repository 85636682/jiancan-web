class AddWeiXinOpenIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :weixin_open_id, :string
  end
end
