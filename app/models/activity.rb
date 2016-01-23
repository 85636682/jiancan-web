class Activity < ActiveRecord::Base
  extend Enumerize
  enumerize :handle,  in: [:random_extraction, :reach_the_limit], default: :random_extraction
  enumerize :status,  in: [:plan, :running, :finished], default: :plan

  belongs_to :shop
  has_many :activity_products
  has_many :products, :through => :activity_products, :dependent => :destroy
  has_many :activity_users
  has_many :users, :through => :activity_users, :dependent => :destroy
end
