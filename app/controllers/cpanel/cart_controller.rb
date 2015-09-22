class Cpanel::CartController < CpanelController
  before_action :set_market_order_market_product, only: [:update, :destroy]

  def index
    @market_order_market_products = current_merchant.market_order_market_products.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @market_order_market_product = MarketOrderMarketProduct.new
    @market_order_market_product.merchant_id = current_merchant.id
    @market_order_market_product.market_product_id = params[:market_product_id]
    @market_order_market_product.count = 1
    if @market_order_market_product.save
      redirect_to cpanel_market_products_path, :notice => "添加成功！"
    else
      redirect_to cpanel_market_products_path, :notice => "添加失败！"
    end
  end

  def update
    if @market_order_market_product.update(:count => params[:count])
      redirect_to cpanel_cart_index_path, :notice => "更新成功！"
    else
      redirect_to cpanel_cart_index_path, :notice => "更新失败！"
    end
  end

  def destroy
    if @market_order_market_product.destroy
      redirect_to cpanel_cart_index_path, :notice => "删除成功！"
    else
      redirect_to cpanel_cart_index_path, :notice => "删除失败！"
    end
  end

  private

  def set_market_order_market_product
    @market_order_market_product = MarketOrderMarketProduct.find(params[:id])
  end
end
