class Cpanel::MarketProductsController < CpanelController
  def index
    @market_products = MarketProduct.all.paginate(:page => params[:page], :per_page => 20)
  end

  def show
  end
end
