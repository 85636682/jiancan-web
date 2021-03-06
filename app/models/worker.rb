class Worker < ApplicationRecord
  extend Enumerize  #pending 订单新建状态  settled订单结算状态  completed 订单完成支付  canceled订单取消
  enumerize :department,     in: [:waiter, :kitchen, :counter], default: :waiter

  has_secure_password

  belongs_to :shop
  has_many :orders

  validates :name, :login, presence: true
  validates :login, uniqueness: true

  def pusher_id
    "#{department}_#{id}"
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
