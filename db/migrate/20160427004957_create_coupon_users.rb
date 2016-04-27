class CreateCouponUsers < ActiveRecord::Migration
  def change
    create_table :coupon_users do |t|
      t.integer :coupon_id
      t.integer :user_id
      t.boolean :used, default: false
      t.datetime :used_at

      t.timestamps null: false
    end
  end
end
