module U1
  class OrderProducts < Grape::API
    resource :order_products do

      params do
      end
      get '', each_serializer: OrderProductSerializer, root: false do
        authenticate!
        OrderProduct.joins(:order).where('orders.user_id' => current_user.id).where('orders.status' => 'completed').order("created_at DESC")
      end

      params do
        requires :order_product_id, type: Integer, desc: "order_product_id"
      end
      get 'one', serializer: OrderProductSerializer, root: false do
        authenticate!
        OrderProduct.find_by_id(params[:order_product_id])
      end

    end
  end
end
