class UserCard < ActiveRecord::Base
  belongs_to :shop
  has_many :user_card_users, :dependent => :destroy
  has_many :users, :through => :user_card_users

  mount_uploader :logo, ImageUploader
  attr_accessor :uploader_secure_token
end
