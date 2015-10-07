class FoodMaterial < ActiveRecord::Base
  belongs_to :shop
  
  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token
end
