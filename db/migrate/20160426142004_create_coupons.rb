class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :title
      t.text :details
      t.decimal :original_price, default: 0
      t.decimal :preferential_price, default: 0
      t.string :avatar
      t.integer :shop_id
      t.integer :coupon_users_count, default: 0

      t.timestamps null: false
    end
  end
end
