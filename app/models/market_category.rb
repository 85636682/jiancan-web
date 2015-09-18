class MarketCategory < ActiveRecord::Base
  has_many :market_products
end
