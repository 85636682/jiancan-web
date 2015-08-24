class Shop < ActiveRecord::Base
  belongs_to :merchant
  has_many :products
  has_many :rooms
  has_many :orders
  has_many :categories
end
