class Shop < ActiveRecord::Base
  extend Enumerize
  serialize :meals, Array
  enumerize :meals, in: [:breakfast, :lunch, :afternoon_tea, :supper, :night_snack], multiple: true

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

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token
end
