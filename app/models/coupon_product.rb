class CouponProduct < ActiveRecord::Base
  belongs_to :coupon
  belongs_to :product
end
