class CouponUser < ActiveRecord::Base
  belongs_to :coupon, :counter_cache => true
  belongs_to :user
end
