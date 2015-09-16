module V1
  class Rooms < Grape::API
    resource :rooms do
      desc '获取某台桌的所有订单'
      get ':id/orders', each_serializer: OrderSerializer, root: 'orders' do
        @orders = Order.where(:room_id => params[:id])
      end

      desc '获取某台桌的订单，如果没有就生成，如果是扫描台桌二维码，用这条api'
      params do
        requires :shop_id, type: Integer, desc: '商铺的Id'
      end
      get ':id/order', serializer: OrderSerializer, root: 'order' do
        @order = Order.find_by_room_id(params[:id])
        if @order.blank?
          @order = Order.new(:shop_id => params[:shop_id], :room_id => params[:id],
                             :sn => Order.create_sn(params[:shop_id]), 
                             :total_price => 0, :takeout => false)
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