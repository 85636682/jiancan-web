class Category < ActiveRecord::Base
  belongs_to :shop
  has_many :products

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token

  validates :name, :shop_id, presence: true

end
