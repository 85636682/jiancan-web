class CreateShopAdvertisements < ActiveRecord::Migration
  def change
    create_table :shop_advertisements do |t|
      t.integer :shop_id
      t.string :title
      t.string :content
      t.decimal :divide_into

      t.timestamps null: false
    end
  end
end
