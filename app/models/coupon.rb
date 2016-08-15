class Coupon < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token

  belongs_to :shop
  has_many :coupon_users, :dependent => :destroy
  has_many :users, :through => :coupon_users
  has_many :coupon_products
  has_many :products, :through => :coupon_products, :dependent => :destroy
  has_many :images, :as => :imageable
end
