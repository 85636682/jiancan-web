class AddCouponUserIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :coupon_user_id, :integer
  end
end
