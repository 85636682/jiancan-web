class Cpanel::OrdersController < CpanelController
  before_action :set_shop, only: [:new]
  before_action :set_order, only: [:show, :edit, :update]

  def index
    @orders = current_merchant.shop.orders
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save!
      redirect_to cpanel_orders_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_shop
    @shop = current_merchant.shop
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:sn, :total_price, :status, :takeout, :user_id, :room_id, :shop_id)
  end
end