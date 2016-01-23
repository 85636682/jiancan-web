class Activity < ActiveRecord::Base
  belongs_to :shop
  has_many :activity_products
  has_many :products, :through => :activity_products, :dependent => :destroy
  has_many :activity_users
  has_many :users, :through => :activity_users, :dependent => :destroy
end
