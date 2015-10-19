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
    end
  end
end
