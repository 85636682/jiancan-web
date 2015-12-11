class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mobile
      t.string :password_digest
      t.string :private_token
      t.string :weixin_access_token
      t.string :weixin_refresh_token

      t.timestamps null: false
    end
  end
end
