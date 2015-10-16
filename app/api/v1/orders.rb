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
        @room = Room.find(params[:room_id])
        if @room.blank? || (@room.shop_id != params[:shop_id])
          error!({ error: "店铺或台桌不存在！" }, 400)
        else
          @order = Order.new(:shop_id => params[:shop_id], :room_id => params[:room_id],
                             :sn => Order.create_sn(params[:shop_id]),
                             :total_price => 0, :takeout => false)
          @order.worker_id = current_worker.id
          if @order.save
            render @order
          else
            error!({ error: @order.errors.full_messages }, 400)
          end
        end
      end

      desc '给订单添加商品'
      params do
        requires :order_id, type: Integer, desc: '订单的id'
        requires :products_quantity, type: String, desc: 'Json格式的字符串，包含所有添加商品id和对应数量，用商品的id作为key，用所选商品的数据作为value'
      end
      post 'products' do
        authenticate!
        @order = Order.find(params[:order_id])
        amount = 0
        success = true
        products_quantity = JSON.parse(params[:products_quantity])
        ActiveRecord::Base.transaction do
          products_quantity.each do |key, value|
            product = Product.find(key)
            if not product.blank?
              order_product = OrderProduct.where(:order_id => @order.id, :product_id => key).first
              if order_product.blank?
                success = OrderProduct.create(:order_id => @order.id, :product_id => key, :quantity => value)
              else
                quantity = order_product.quantity + value.to_i
                success = order_product.update(:quantity => quantity)
              end
              amount += product.price.to_i * value.to_i
            end
          end
          total_price = @order.total_price + amount
          success = @order.update(:total_price => total_price)
        end

        if success
          render @order
        else
          error!({ error: "商品实效，导致添加失败！" }, 400)
        end
      end

      desc '根据订单号SN搜索订单'
      params do
        requires :sn, type: String, desc: '订单编号'
      end
      get 'search' do
        @order = Order.find_by_sn(params[:sn])
      end

      desc '订单结账'
      params do
        requires :order_id, type: Integer, desc: '订单ID'
      end
      get 'settle' do
        @order = Order.find(params[:order_id])
        if @order.blank?
          error!({ error: "订单不存在！" }, 400)
        else
          if @order.pending?
            @order.settled
            render @order
          else
            error!({ error: "订单已经结账！" }, 400)
          end
        end
      end

    end
  end
end
