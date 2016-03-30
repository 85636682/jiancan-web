module U1
  class Rooms < Grape::API
    resource :rooms do

      desc '获取单一台桌'
      params do
        requires :room_id, type: Integer, desc: '台桌id'
      end
      get 'one', serializer: RoomSerializer, root: false do
        @room = Room.find_by_id(params[:room_id])
        if @room.blank?
          error!({ error: "台桌不存在！" }, 400)
        end
        render @room
      end

      desc '获取某台桌的订单，如果没有就生成，如果是扫描台桌二维码，用这条api'
      params do
        requires :room_id, type: Integer, desc: '台桌的Id'
      end
      get 'order', serializer: OrderSerializer, root: false do
        authenticate!
        @room = Room.find_by_id(params[:room_id])
        if @room.blank?
          error!({ error: "台桌不存在！" }, 400)
        else
          @order = Order.where("room_id = ? AND status = 'pending'", @room.id).first
          if @order.blank?
            @order = Order.new(:shop_id => @room.shop.id, :room_id => @room.id,
                               :sn => Order.create_sn(@room.shop.id),
                               :total_price => 0, :takeout => false,
                               :user_id => current_user.id)
            if @order.save
              render @order
            else
              error!({ error: @order.errors.full_messages }, 400)
            end
          else
            if @order.user.blank? || @order.user_id != current_user.id
              error!({ error: "您的订单不存在！" }, 400)
            else
              render @order
            end
          end
        end
      end

    end
  end
end
