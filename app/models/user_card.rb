class UserCard < ActiveRecord::Base
  belongs_to :shop

  mount_uploader :logo, ImageUploader
  attr_accessor :uploader_secure_token
end
