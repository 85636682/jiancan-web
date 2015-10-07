class Shop < ActiveRecord::Base
  belongs_to :merchant
  has_many :products
  has_many :rooms
  has_many :orders
  has_many :categories
  has_many :workers
  has_many :food_materials

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token
end
