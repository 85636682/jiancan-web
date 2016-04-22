module U1
  class OrderProducts < Grape::API
    resource :order_products do
      params do
      end
      get '', each_serializer: OrderProductSerializer, root: false do
        authenticate!
        OrderProduct.joins(:order).where('orders.user_id' => current_user.id).order("created_at DESC")
      end
    end
  end
end
