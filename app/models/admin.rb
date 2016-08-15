class Admin < ApplicationRecord
  has_secure_password

  validates_presence_of :password, :on => :create

  # 重新生成 Private Token
  def update_private_token
    random_key = "#{SecureRandom.hex(10)}:#{id}"
    update_attribute(:private_token, random_key)
  end

  after_create :ensure_private_token!
  def ensure_private_token!
    update_private_token if private_token.blank?
  end
end
