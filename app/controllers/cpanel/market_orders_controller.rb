class Cpanel::MarketOrdersController < CpanelController
  before_action :set_market_order, only: [:show, :destroy]

  def index
    @market_orders = current_merchant.market_orders.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def show
    
  end

  def create
    @market_order = MarketOrder.new
    @market_order.sn = MarketOrder.create_sn(current_merchant.shop.id)
    @market_order.merchant_id = current_merchant.id
    @market_order.shop_id = current_merchant.shop.id
    if @market_order.save
      @market_order_market_products = current_merchant.market_order_market_products.where(:market_order_id => nil)

      total_price = 0
      @market_order_market_products.each do |market_order_market_product|
        total_price += (market_order_market_product.market_product.price * market_order_market_product.count)
      end
      @market_order.update(:total_price => total_price)

      @market_order_market_products.update_all(:market_order_id => @market_order.id)

      redirect_to cpanel_market_orders_path, :notice => "保存成功！"
    else
      redirect_to cpanel_market_orders_path, :notice => "保存失败！"
    end
  end

  def destroy
    if @market_order.destroy
      redirect_to cpanel_market_orders_path, :notice => "删除成功！"
    else
      redirect_to cpanel_market_orders_path, :notice => "删除失败！"
    end
  end

  private

  def set_market_order
    @market_order = MarketOrder.find(params[:id])
  end
end
