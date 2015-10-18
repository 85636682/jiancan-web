module V1
  class Orders < Grape::API
    resource :orders do
      desc '创建订单'
      params do
        requires :room_id, type: Integer, desc: "台桌房间id"
      end
      post '', serializer: OrderSerializer, root: 'order' do
        authenticate!
        @room = Room.find_by_id(params[:room_id])
        if @room.blank?
          error!({ error: "台桌不存在！" }, 400)
        else
          @order = Order.where("room_id = ? AND status = 'pending'", @room.id).first
          if @order.blank?
            @order = Order.new(:shop_id => @room.shop.id, :room_id => @room.id,
                               :sn => Order.create_sn(@room.shop.id),
                               :total_price => 0, :takeout => false)
            @order.worker_id = current_worker.id
            if not @order.save
              error!({ error: @order.errors.full_messages }, 400)
            end
          end
          render @order
        end
      end

      desc '给订单添加商品'
      params do
        requires :order_id, type: Integer, desc: '订单的id'
        requires :products_quantity, type: String, desc: 'Json格式的字符串，包含所有添加商品id和对应数量，用商品的id作为key，用所选商品的数据作为value'
      end
      post 'products' do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        if @order.blank?
          error!({ error: "订单不存在！" }, 400)
        else
          amount = 0
          success = true
          products_quantity = JSON.parse(params[:products_quantity])
          ActiveRecord::Base.transaction do
            products_quantity.each do |key, value|
              product = Product.find_by_id(key)
              if not product.blank?
                order_product = OrderProduct.where(:order_id => @order.id, :product_id => key).first
                if order_product.blank? || !order_product.pending?
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
      end

      desc '从订单删除状态为pending的菜色'
      params do
        requires :order_product_id, type: Integer, desc: 'order_product的id'
      end
      delete 'products' do
        @order_product = OrderProduct.find_by_id(params[:order_product_id])
        if @order_product.blank? || !@order_product.pending?
          error!({ error: "菜色不存在或者已经烹煮！" }, 400)
        else
          if @order_product.destroy
            { msg: '删除成功！' }
          else
            error!({ error: "菜色删除失败！" }, 400)
          end
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
        @order = Order.find_by_id(params[:order_id])
        if @order.blank? || @order.pendings_count > 0
          error!({ error: "订单不存在或者还有菜色未完成！" }, 400)
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
