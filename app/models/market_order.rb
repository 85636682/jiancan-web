class MarketOrder < ActiveRecord::Base
  belongs_to :merchant
  has_many :market_order_market_products, :dependent => :destroy
  has_many :market_products, :through => :market_order_market_products, :dependent => :destroy

  def self.create_sn(shop_id)
    "MO" + DateTime.parse(Time.now.iso8601).strftime('%Y%m%d%H%M') + sprintf('%05d', shop_id) + rand(999).to_s
  end
end
