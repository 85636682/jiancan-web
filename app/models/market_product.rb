class MarketProduct < ActiveRecord::Base
  belongs_to :market_category

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token
end
