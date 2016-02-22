class AddAvatarToShopAdvertisement < ActiveRecord::Migration
  def change
    add_column :shop_advertisements, :avatar, :string
  end
end
