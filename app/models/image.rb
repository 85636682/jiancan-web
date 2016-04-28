class Image < ActiveRecord::Base
  mount_uploader :img, ImageUploader
  attr_accessor :uploader_secure_token

  belongs_to :imageable, :polymorphic => true
end
