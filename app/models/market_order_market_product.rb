class MarketOrderMarketProduct < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :market_order
  belongs_to :market_product
end
