class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :category
  has_many :order_products
  has_many :orders, :through => :order_products, :dependent => :destroy
  has_many :comments, :through => :order_products, :dependent => :destroy

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token
end
