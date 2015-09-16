module V1
  class Orders < Grape::API
    resource :orders do
      desc '创建订单'
      params do
        requires :shop_id, type: Integer, desc: "店铺id"
        requires :room_id, type: Integer, desc: "台桌房间id"
      end
      post '', serializer: OrderSerializer, root: 'order' do
        authenticate!
        @order = Order.new(:shop_id => params[:shop_id], :room_id => room_id,
                           :sn => Order.create_sn(params[:shop_id]), 
                           :total_price => 0, :takeout => false)
        if @order.save
          render @order
        else
          error!({ error: @reply.errors.full_messages }, 400)
        end
      end

      desc '返回某个商铺或者商铺某台桌的订单'
      params do
        requires :shop_id, type: Integer, desc: '商铺的Id'
        optional :room_id, type: Integer, desc: '如果你需要只看某台桌的订单，请传此参数'
      end
      get '', each_serializer: OrderSerializer, root: 'orders' do
        authenticate!
        if params[:room_id].blank?
          @orders = Order.where(:shop_id => params[:shop_id]).order("created_at ASC")
        else
          @orders = Order.where(:room_id => params[:room_id]).order("created_at ASC")
        end
      end

      desc '给订单添加商品'
      params do
        requires :products_quantity, type: Array[Integer], desc: '包含所有添加商品的ids'
      end
      post ':id/products' do
        authenticate!
        @order = Order.find(params[:id])
        amount = 0
        params[:products_quantity].each do |key, value|
          product = Product.find(key)
          if not product.blank?
            OrderProduct.create(:order_id => @order.id, :product_id => key, :quantity => value)
            amount += product.price.to_i * value.to_i
          end
        end
        @order.update(:amount => amount)
      end
    end
  end
end