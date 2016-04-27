class Coupon < ActiveRecord::Base
  belongs_to :shop
  has_many :coupon_users, :dependent => :destroy
  has_many :users, :through => :coupon_users
end
