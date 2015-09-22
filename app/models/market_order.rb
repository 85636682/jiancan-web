class MarketOrder < ActiveRecord::Base
  has_many :market_order_market_products
  has_many :market_products, :through => :market_order_market_products, :dependent => :destroy
end
