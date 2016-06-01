module C1
  class Orders < Grape::API
    resource :orders do

      desc '简餐配送的订单'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'express', each_serializer: OrderDetailSerializer, root: false  do
        authenticate!
        @orders = Order.where("status = 'express' AND takeout = true AND send_method = 'jiancan' AND expressed = false").offset(params[:offset]).limit(params[:limit]).order("created_at DESC")
      end

      desc '更新是否已经配送'
      params do
        requires :order_id, type: Integer, desc: '订单id'
      end
      post 'expressed' do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "订单已配送！" }, 400) if @order.expressed
        error!({ error: "订单不是简餐配送！" }, 400) if @order.send_method.merchant?
        if @order.update_attributes(:expressed => true, :courier_id => current_courier.id)
          { msg: 'ok', expressed: true, courier_id: current_courier.id }
        else
          error!({ error: "配送失败！" }, 400)
        end
      end

    end
  end
end
