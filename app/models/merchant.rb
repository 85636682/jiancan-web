class Merchant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :shop
  has_many :notifications, :dependent => :destroy
  has_many :market_order_market_products
  has_many :market_orders

  # 重新生成 Private Token
  def update_private_token
    random_key = "#{SecureRandom.hex(10)}:#{id}"
    update_attribute(:private_token, random_key)
  end

  after_create :ensure_private_token!
  def ensure_private_token!
    update_private_token if private_token.blank?
  end

  def temp_access_token
    Rails.cache.fetch("user-#{id}-temp_access_token-#{Time.now.strftime('%Y%m%d')}") do
      SecureRandom.hex
    end
  end
end
