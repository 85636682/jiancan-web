module V1
  class Rooms < Grape::API
    resource :rooms do
      desc '获取某台桌的所有订单'
      params do
        requires :room_id, type: Integer
        requires :status, type: Symbol, values: [:pending, :settled, :completed, :canceled], default: :pending, desc: "pending 订单消费状态  settled订单结算状态  completed 订单完成支付  canceled订单取消"
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'orders', each_serializer: OrderSerializer, root: 'orders' do
        @orders = Order.where("room_id = ? AND status = ?", params[:room_id], params[:status]).offset(params[:offset]).limit(params[:limit]).order("id DESC")
      end

      desc '获取某台桌的订单，如果没有就生成，如果是扫描台桌二维码，用这条api'
      params do
        requires :room_id, type: Integer, desc: '台桌的Id'
      end
      get 'order', serializer: OrderSerializer, root: 'order' do
        authenticate!
        @room = Room.find(params[:room_id])
        if @room.blank?
          error!({ error: "台桌不存在！" }, 400)
        else
          @order = Order.find_by_room_id(@room.id)
          if @order.blank?
            @order = Order.new(:shop_id => @room.shop.id, :room_id => @room.id,
                               :sn => Order.create_sn(@room.shop.id), 
                               :total_price => 0, :takeout => false)
            @order.worker_id = current_worker.id
          end
          if @order.save
            render @order
          else
            error!({ error: @order.errors.full_messages }, 400)
          end
        end
        
      end
    end
  end
end