module U1
  class OrderProducts < Grape::API
    resource :order_products do
      params do
      end
      get '', each_serializer: OrderProductSerializer, root: false do
        authenticate!
        OrderProduct.joins(:order).where('order.user_id' => current_user.id)
      end
    end
  end
end
