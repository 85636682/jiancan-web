class Cpanel::MarketProductsController < CpanelController
  def index
    @market_products = MarketProduct.all
  end

  def show
  end
end
