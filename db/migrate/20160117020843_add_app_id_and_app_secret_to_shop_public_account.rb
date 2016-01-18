class AddAppIdAndAppSecretToShopPublicAccount < ActiveRecord::Migration
  def change
    add_column :shop_public_accounts, :app_id, :string
    add_column :shop_public_accounts, :app_secret, :string
  end
end
