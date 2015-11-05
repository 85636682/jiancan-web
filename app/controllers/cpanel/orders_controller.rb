class Cpanel::OrdersController < CpanelController
  before_action :set_shop, only: [:new]
  before_action :set_order, only: [:show, :edit, :update, :destroy, :settle, :complete]

  def index
    @orders = current_merchant.shop.orders.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.room_id.blank? && !@order.takeout
      redirect_to new_cpanel_order_path, :alert => "非外卖订单要选择台号！"
    elsif @order.takeout && !@order.room_id.blank?
      redirect_to new_cpanel_order_path, :alert => "外卖订单不用选择台号！"
    else
      if not @order.takeout
        tmp_order = Order.where(:room_id => @order.room_id, :status => 'pending').first
        if not tmp_order.blank?
          redirect_to new_cpanel_order_path, :alert => "此台桌还有未结算的订单！"
          return
        end
      end

      @order.sn = Order.create_sn(current_merchant.shop.id)
      @order.total_price = 0
      @order.user_id = 0
      @order.shop_id = current_merchant.shop.id
      if @order.save!
        redirect_to cpanel_order_path(@order), :notice => "保存成功！"
      else
        render :new, :alert => "保存失败！"
      end
    end
  end

  def edit
  end

  def update
    if @order.takeout
      redirect_to cpanel_order_path(@order), :alert => "外卖单不能修改！"
    else
      if @order.room_id != params[:order][:room_id].to_i
        tmp_order = Order.where(:room_id => @order.room_id, :status => 'pending').first
        if not tmp_order.blank?
          redirect_to edit_cpanel_order_path(@order), :alert => "所选择的台桌还有未结算的订单！"
          return
        end
      end
      if @order.update(order_params)
        redirect_to cpanel_order_path(@order), :notice => "修改成功！"
      else
        redirect_to cpanel_order_path(@order), :notice => "修改失败！"
      end
    end
  end

  def destroy
    #if @order.pending?
      if @order.destroy
        redirect_to cpanel_orders_path, :notice => '删除成功！'
      else
        redirect_to cpanel_orders_path, :alert => '删除失败！'
      end
    #else
    #  redirect_to cpanel_order_path(@order), :alert => '此订单已经结账，不能删除！'
    #end
  end

  def settle
    if @order.pendings_count > 0
      redirect_to cpanel_order_path(@order), :alert => "结账失败，还有菜色还未完成！"
    else
      if @order.pending?
        @order.settled
        redirect_to cpanel_order_path(@order), :notice => "结账成功！"
      else
        redirect_to cpanel_order_path(@order), :alert => "订单已经结账！"
      end
    end
  end

  def cancel
    if @order.pending?
      @order.canceled
      redirect_to cpanel_orders_path, :notice => "取消成功！"
    else
      redirect_to cpanel_order_path(@order), :alert => "取消失败，订单已经结账！"
    end
  end

  def search
    @order = Order.find_by_sn(params[:sn])
    if @order.blank?
      redirect_to cpanel_orders_path, :alert => '没有该订单！'
    else
      redirect_to cpanel_order_path(@order), :notice => '搜索成功！'
    end
  end

  private

  def set_shop
    @shop = current_merchant.shop
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:sn, :total_price, :status, :takeout, :user_id, :room_id, :worker_id, :collect)
  end
end
