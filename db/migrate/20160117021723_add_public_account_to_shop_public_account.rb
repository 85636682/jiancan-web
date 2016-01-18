class AddPublicAccountToShopPublicAccount < ActiveRecord::Migration
  def change
    add_column :shop_public_accounts, :public_account, :string
  end
end
