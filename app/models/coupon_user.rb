class CouponUser < ApplicationRecord
  validates_uniqueness_of :random_code, :message => '随机码重复，请联系客服！'

  belongs_to :coupon, :counter_cache => true
  belongs_to :user
end
