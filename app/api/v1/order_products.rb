module V1
  class OrderProducts < Grape::API
    resource :order_products do
      desc '更新订单里菜色的状态'
      params do
        requires :order_product_id, type: Integer, desc: "订单菜色的ID"
        requires :status, type: Symbol, values: [:pending, :cooking, :finished, :canceled], desc: "订单菜色的状态"
      end
      put 'status' do
        authenticate!
        @order_product = OrderProduct.find_by_id(params[:order_product_id])
        if @order_product.blank?
          error!({ error: "该订单不存在此菜色！" }, 400)
        else
          if @order_product.update(:status => params[:status])
            { msg: 'ok' }
          else
            error!({ error: "更新失败！" }, 400)
          end
        end
      end

      desc '减少订单里菜色的数量'
      params do
        requires :order_product_id, type: Integer, desc: "订单菜色的ID"
        requires :quantity, type: Integer, default: 1, values: -20..20, desc: "减少的数量，默认为1"
      end
      put 'quantity' do
        authenticate!
        @order_product = OrderProduct.find_by_id(params[:order_product_id])
        if @order_product.blank?
          error!({ error: "该订单不存在此菜色！" }, 400)
        else
          success = true
          temp_quantity = @order_product.quantity + params[:quantity].to_i
          temp_total_price = @order_product.order.total_price + @order_product.product.price * params[:quantity].to_i
          ActiveRecord::Base.transaction do
            success = @order_product.order.update(:total_price => temp_total_price)
            success = @order_product.update(:quantity => temp_quantity)
          end
          if success
            { msg: 'ok' }
          else
            error!({ error: "更新失败！" }, 400)
          end
        end
      end
    end
  end
end
