class AddRandomCodeToCouponUser < ActiveRecord::Migration
  def change
    add_column :coupon_users, :random_code, :string
  end
end
