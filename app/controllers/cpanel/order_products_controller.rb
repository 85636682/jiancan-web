class Cpanel::OrderProductsController < CpanelController
  def new
    @products = current_merchant.shop.products.order("category_id ASC")
    @order = Order.find(params[:order_id])
  end

  def create
    @order = Order.find(params[:order_id])
    amount = 0
    success = true
    #这里要改
    products_quantity = params[:products_quantity]
    ActiveRecord::Base.transaction do
      products_quantity.each do |key, value|
        next if value.to_i < 1
        product = Product.find(key)
        if not product.blank?
          order_product = OrderProduct.where(:order_id => @order.id, :product_id => key).first
          if order_product.blank?
            quantity = value.to_i
            success = OrderProduct.create(:order_id => @order.id, :product_id => key, :quantity => quantity)
          else
            quantity = order_product.quantity + value.to_i
            success = order_product.update(:quantity => quantity)
          end
          amount += product.price.to_i * quantity
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
end
