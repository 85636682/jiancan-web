class CreateShopAdvertisementUsers < ActiveRecord::Migration
  def change
    create_table :shop_advertisement_users do |t|
      t.integer :shop_advertisement_id
      t.integer :user_id
      t.integer :forwarding_times

      t.timestamps null: false
    end
  end
end
