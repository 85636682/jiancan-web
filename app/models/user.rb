class User < ActiveRecord::Base
  has_secure_password

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token

  has_many :orders
  has_many :receiving_addresses
  has_many :favorites, dependent: :destroy
  has_many :favorite_shops, :through => :favorites, :source => :favoriteable, :source_type => "Shop"

  def pusher_id
    "user_#{id}"
  end

  # 重新生成 Private Token
  def update_private_token
    random_key = "#{SecureRandom.hex(10)}:#{id}"
    update_attributes(:private_token => random_key, :private_token_updated_at => Time.zone.now)
  end

  after_create :ensure_private_token!
  def ensure_private_token!
    update_private_token
  end

  def get_private_token
    ensure_private_token!
    private_token
  end

  def check_token_updated
    private_token_updated_at > Time.zone.now - 7.days
  end

end
