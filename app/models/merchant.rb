class Merchant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  has_secure_password

  has_one :shop
  has_many :notifications, :dependent => :destroy

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

  def temp_access_token
    Rails.cache.fetch("user-#{id}-temp_access_token-#{Time.now.strftime('%Y%m%d')}") do
      SecureRandom.hex
    end
  end
end
