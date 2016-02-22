class ShopAdvertisement < ActiveRecord::Base
  belongs_to :shop
  has_many :shop_advertisement_users
  has_many :users, :through => :shop_advertisement_users, :dependent => :destroy

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token
end
