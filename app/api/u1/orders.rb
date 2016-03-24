module U1
  class Orders < Grape::API
    resource :orders do

      desc '获取用户订单'
      params do
      end
      get '', each_serializer: OrderSerializer, root: false do
        authenticate!
        @orders = current_user.orders
      end

      desc '获取用户单一订单'
      params do
        requires :order_id, type: Integer, desc: '订单id'
      end
      get 'one', serializer: OrderSerializer, root: false do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
      end

      desc '新建外卖单'
      params do
        requires :order, type: Hash do
          requires :shop_id, type: Integer, desc: '店铺的id'
          requires :takeout, type: Boolean, desc: ''
          requires :pay_method, type: String, desc: ''
          requires :meal_time, type: String, desc: ''
          requires :remarks, type: String, desc: ''
          requires :address, type: String, desc: ''
        end
        requires :products_quantity, type: String, desc: 'Json格式的字符串，用商品的id作为key，用所选商品的数量作为value'
      end
      post '', serializer: OrderSerializer, root: false do
        authenticate!
        begin
          ActiveRecord::Base.transaction do
            @order = Order.new(params[:order])
            @order.room_id = 0
            @order.sn = Order.create_sn(params[:order][:shop_id])
            @order.total_price = 0
            @order.user = current_user

            @order.save!

            amount = 0
            products_quantity = JSON.parse(params[:products_quantity])

            products_quantity.each do |key, value|
              next if value.to_i < 1
              product = Product.find_by_id(key)
              if not product.blank?
                order_product = OrderProduct.where(:order_id => @order.id, :product_id => key, :status => "pending").first
                if order_product.blank?
                  order_product = OrderProduct.create!(:order_id => @order.id, :product_id => key, :quantity => value)
                else
                  quantity = order_product.quantity + value.to_i
                  order_product.update_attributes!(:quantity => quantity)
                end
                order_product.push_to_kitchen(OrderProductSerializer.new(order_product, root: false).as_json)
                amount += product.price.to_i * value.to_i
              end
            end
            total_price = @order.total_price + amount
            @order.update_attributes!(:total_price => total_price)

          end
          render @order
        rescue Exception => e
          error!({ error: "订单创建失败！#{e.message}" }, 400)
        end

      end

      desc '给订单添加商品'
      params do
        requires :order_id, type: Integer, desc: '订单的id'
        requires :products_quantity, type: String, desc: 'Json格式的字符串，包含所有添加商品id和对应数量，用商品的id作为key，用所选商品的数据作为value'
      end
      post 'products', serializer: OrderSerializer, root: false do
        authenticate!
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        error!({ error: "你不能操作该订单！" }, 400) if @order.user_id != current_user.id

        amount = 0
        success = true
        products_quantity = JSON.parse(params[:products_quantity])
        ActiveRecord::Base.transaction do
          products_quantity.each do |key, value|
            next if value.to_i < 1
            product = Product.find_by_id(key)
            if not product.blank?
              order_product = OrderProduct.where(:order_id => @order.id, :product_id => key, :status => "pending").first
              if order_product.blank?
                success = order_product = OrderProduct.create(:order_id => @order.id, :product_id => key, :quantity => value)
              else
                quantity = order_product.quantity + value.to_i
                success = order_product.update(:quantity => quantity)
              end
              order_product.push_to_kitchen(OrderProductSerializer.new(order_product, root: false).as_json)
              amount += product.price.to_i * value.to_i
            end
          end
          total_price = @order.total_price + amount
          success = @order.update(:total_price => total_price)
        end

        if success
          render @order
        else
          error!({ error: "商品失效，导致添加失败！" }, 400)
        end
      end

      desc '从订单删除状态为pending的菜色'
      params do
        requires :order_product_id, type: Integer, desc: 'order_product的id'
      end
      delete 'products' do
        @order_product = OrderProduct.find_by_id(params[:order_product_id])
        error!({ error: "你不能操作该订单！" }, 400) if @order_product.order.user_id != current_user.id
        error!({ error: "菜色不存在或者已经烹煮！" }, 400) if @order_product.blank? || !@order_product.pending?

        if @order_product.destroy
          { msg: 'ok' }
        else
          error!({ error: "菜色删除失败！" }, 400)
        end
      end

      desc '根据订单号SN搜索订单'
      params do
        requires :sn, type: String, desc: '订单编号'
      end
      get 'search', serializer: OrderSerializer, root: false do
        @order = Order.find_by_sn(params[:sn])
        if @order.user_id != current_user.id
          error!({ error: "你不能操作该订单！" }, 400)
        else
          render @order
        end
      end

      desc '订单结账'
      params do
        requires :order_id, type: Integer, desc: '订单ID'
      end
      get 'settle' do
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "你不能操作该订单！" }, 400) if @order.user_id != current_user.id
        error!({ error: "订单不存在或者还有菜色未完成！" }, 400) if @order.blank? || @order.pendings_count > 0

        if @order.pending? && @order.settled
          { msg: 'ok', status: @order.status, status_text: @order.status.text }
        else
          error!({ error: "订单已经结账！" }, 400)
        end
      end

    end
  end
end
