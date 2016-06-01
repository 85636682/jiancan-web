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
      put 'expressed' do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "订单已配送！" }, 400) if @order.expressed
        error!({ error: "订单不是简餐配送！" }, 400) if @order.send_method.merchant?
        if @order.update_attributes(:expressed => true, :courier_id => current_courier.id, :express_status => :wait)
          { msg: 'ok', expressed: true, express_status: "wait", courier_id: current_courier.id }
        else
          error!({ error: "配送失败！" }, 400)
        end
      end

      desc '更新已取货'
      params do
        requires :order_id, type: Integer, desc: '订单id'
      end
      put 'picked' do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "订单不是简餐配送！" }, 400) if @order.send_method.merchant?
        error!({ error: "订单未被快递员认单！" }, 400) if not @order.express_status.wait?
        if @order.update_attributes(:express_status => :picked)
          { msg: 'ok', express_status: "picked" }
        else
          error!({ error: "取货失败！" }, 400)
        end
      end

      desc '更新已送达'
      params do
        requires :order_id, type: Integer, desc: '订单id'
      end
      put 'sent' do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "订单不是简餐配送！" }, 400) if @order.send_method.merchant?
        error!({ error: "订单未被快递员取货！" }, 400) if not @order.express_status.picked?
        if @order.update_attributes(:express_status => :sent)
          { msg: 'ok', express_status: "sent" }
        else
          error!({ error: "送达失败！" }, 400)
        end
      end

      desc '根据订单号SN搜索订单'
      params do
        requires :sn, type: String, desc: '订单编号'
      end
      get 'search', serializer: OrderDetailSerializer, root: false do
        @order = Order.find_by_sn(params[:sn])
      end

    end
  end
end
