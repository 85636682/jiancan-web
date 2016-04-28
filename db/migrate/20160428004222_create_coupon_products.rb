class CreateCouponProducts < ActiveRecord::Migration
  def change
    create_table :coupon_products do |t|
      t.integer :coupon_id
      t.integer :product_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
