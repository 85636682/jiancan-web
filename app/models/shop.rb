class Shop < ActiveRecord::Base

  belongs_to :merchant
  has_many :products
  has_many :rooms
  has_many :orders
  has_many :categories
  has_many :workers
  has_many :food_materials
  has_many :activities
  has_many :shop_advertisements
  has_one :shop_public_account
  has_many :comments, as: :commentable
  has_many :bookings
  has_many :coupons

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token

  validates_uniqueness_of :name, :message => "你的店铺名称重复了"
end
