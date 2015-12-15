class Cpanel::OrderProductsController < CpanelController
  before_action :set_order, only: [:new, :create]

  def new
    @products = current_merchant.shop.products.order("category_id ASC")
  end

  def create
    amount = 0
    products_quantity = params[:products_quantity]
    begin
      ActiveRecord::Base.transaction do
        products_quantity.each do |key, value|
          next if value.to_i < 1
          product = Product.find(key)
          if not product.blank?
            order_product = OrderProduct.where(:order_id => @order.id, :product_id => key, :status => "pending").first
            if order_product.blank?
              order_product = OrderProduct.create!(:order_id => @order.id, :product_id => key, :quantity => value)
            else
              quantity = order_product.quantity + value.to_i
              order_product.update_attributes!(:quantity => quantity)
            end
            order_product.push_to_kitchen(OrderProductSerializer.new(order_product, root: false).as_json)
            amount += product.price.to_i * value.to_i
          end
        end
        total_price = @order.total_price + amount
        @order.update_attributes!(:total_price => total_price)
      end
      redirect_to cpanel_order_path(@order), :notice => "添加成功！"
    rescue Exception => e
      redirect_to cpanel_order_path(@order), :alert => "添加删除！"
    end

  end

  def status
    @order_product = OrderProduct.find(params[:id])
    success = false
    case @order_product.status
    when 'pending'
      success = @order_product.update_attributes(:status => 'cooking')
    when 'cooking'
      success = @order_product.update_attributes(:status => 'finished')
    when 'finished'
      success = true
    end
    if success
      @order_product.push_to_waiter
      redirect_to cpanel_order_path(@order_product.order), :notice => "更新成功！"
    else
      redirect_to cpanel_order_path(@order_product.order), :alert => "更新失败或已完成！"
    end
  end

  def destroy
    #if @order.pending?
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order
      if @order_product.destroy
        redirect_to cpanel_order_path(@order), :notice => '删除成功！'
      else
        redirect_to cpanel_order_path(@order), :alert => '删除失败！'
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
