class Coupon < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token
  
  belongs_to :shop
  has_many :coupon_users, :dependent => :destroy
  has_many :users, :through => :coupon_users
end
