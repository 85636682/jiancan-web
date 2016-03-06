class User < ActiveRecord::Base
  has_secure_password

  mount_uploader :avatar, ImageUploader
  attr_accessor :uploader_secure_token

  has_many :orders
  has_many :receiving_addresses
  has_many :favorites, dependent: :destroy
  has_many :favorite_shops, :through => :favorites, :source => :favoriteable, :source_type => "Shop"
  has_many :activity_users
  has_many :activities, :through => :activity_users, :dependent => :destroy
  has_many :shop_advertisement_users
  has_many :shop_advertisements, :through => :shop_advertisement_users, :dependent => :destroy
  has_many :user_card_users, :dependent => :destroy
  has_many :user_cards, :through => :user_card_users

  def self.from_omniauth(auth)
    where(weixin_open_id: auth["openid"]).first_or_create do |user|
      user.password = User.friendly_token[0, 20]
      user.nickname = auth["nickname"]
      user.avatar = auth["headimgurl"]
      user.private_token = "#{SecureRandom.hex(10)}:#{user.id}"
      user.private_token_updated_at = Time.zone.now
    end
  end

  def self.friendly_token(length = 20)
    # To calculate real characters, we must perform this operation.
    # See SecureRandom.urlsafe_base64
    rlength = (length * 3) / 4
    SecureRandom.urlsafe_base64(rlength).tr('lIO0', 'sxyz')
  end

  def pusher_id
    "user_#{id}"
  end

  def showed
    return nickname if not nickname.blank?
    return mobile if not mobile.blank?
    return ""
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
