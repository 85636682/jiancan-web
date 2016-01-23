class Activity < ActiveRecord::Base
  extend Enumerize
  enumerize :handle,  in: [:random, :limit], default: :random
  enumerize :status,  in: [:running, :finished], default: :pending

  belongs_to :shop
  has_many :activity_products
  has_many :products, :through => :activity_products, :dependent => :destroy
  has_many :activity_users
  has_many :users, :through => :activity_users, :dependent => :destroy
end
