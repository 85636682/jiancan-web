class Coupon < ActiveRecord::Base
  has_many :coupon_users, :dependent => :destroy
  has_many :users, :through => :coupon_users
end
