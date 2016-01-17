class CreateShopPublicAccounts < ActiveRecord::Migration
  def change
    create_table :shop_public_accounts do |t|
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
