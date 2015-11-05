class Cpanel::OrderProductsController < CpanelController
  before_action :set_order, only: [:new, :create]

  def new
    @products = current_merchant.shop.products.order("category_id ASC")
  end

  def create
    amount = 0
    success = true
    #这里要改
    products_quantity = params[:products_quantity]
    ActiveRecord::Base.transaction do
      products_quantity.each do |key, value|
        next if value.to_i < 1
        product = Product.find(key)
        if not product.blank?
          order_product = OrderProduct.where(:order_id => @order.id, :product_id => key, :status => "pending").first
          if order_product.blank?
            success = OrderProduct.create(:order_id => @order.id, :product_id => key, :quantity => value)
          else
            quantity = order_product.quantity + value.to_i
            success = order_product.update(:quantity => quantity)
          end
          amount += product.price.to_i * value.to_i
        end
      end
      total_price = @order.total_price + amount
      success = @order.update(:total_price => total_price)
    end

    if success
      redirect_to cpanel_order_path(@order), :notice => "添加成功！"
    else
      redirect_to cpanel_order_path(@order), :alert => "添加删除！"
    end
  end

  def status
    @order_product = OrderProduct.find(params[:id])
    case @order_product.status
    when 'pending'
      status = 'cooking'
    when 'cooking'
      status = 'finished'
    when 'finished'
      status = 'NoUpdate'
    end
    puts status
    if status == 'NoUpdate' || @order_product.update(:status => status)
      redirect_to cpanel_order_path(@order_product.order), :notice => "更新成功！"
    else
      redirect_to cpanel_order_path(@order_product.order), :alert => "更新失败！"
    end
  end

  def destroy
    #if @order.pending?
    @order_product.find(params[:id])
      if @order_product.destroy
        redirect_to cpanel_order_products_path, :notice => '删除成功！'
      else
        redirect_to cpanel_order_products_path, :alert => '删除失败！'
      end
    #else
    #  redirect_to cpanel_order_path(@order), :alert => '此订单已经结账，不能删除！'
    #end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end
end
