class Order < ActiveRecord::Base
  enumerize :status,     in: [:pending, :settled, :completed, :canceled], default: :pending

  belongs_to :shop
  belongs_to :room
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products, :dependent => :destroy

  def self.create_sn(shop_id)
    DateTime.parse(Time.now.iso8601).strftime('%Y%m%d%H%M') + sprintf('%05d', shop_id) + rand(999).to_s
  end
end
