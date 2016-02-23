module V1
  class Orders < Grape::API
    resource :orders do

      desc '给订单添加商品'
      params do
        requires :order_id, type: Integer, desc: '订单的id'
        requires :products_quantity, type: String, desc: 'Json格式的字符串，包含所有添加商品id和对应数量，用商品的id作为key，用所选商品的数据作为value'
      end
      post 'products', serializer: OrderSerializer, root: false do
        authenticate!
        waiter_or_counter!
        @order = Order.find_by_id(params[:order_id])
        if @order.blank?
          error!({ error: "订单不存在！" }, 400)
        else
          amount = 0
          products_quantity = JSON.parse(params[:products_quantity])
          begin
            ActiveRecord::Base.transaction do
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
                  order_product.push_to_counter(OrderProductSerializer.new(order_product, root: false).as_json)
                  amount += product.price.to_i * value.to_i
                end
              end
              total_price = @order.total_price + amount
              @order.update_attributes!(:total_price => total_price)
            end
            render @order
          rescue Exception => e
            error!({ error: "商品失效，导致添加失败！" }, 400)
          end

        end
      end

      desc '从订单删除状态为pending的菜色'
      params do
        requires :order_product_id, type: Integer, desc: 'order_product的id'
      end
      delete 'products' do
        authenticate!
        waiter_or_counter!
        @order_product = OrderProduct.find_by_id(params[:order_product_id])
        if @order_product.blank? || !@order_product.pending?
          error!({ error: "菜色不存在或者已经烹煮！" }, 400)
        else
          if @order_product.destroy
            { msg: 'ok' }
          else
            error!({ error: "菜色删除失败！" }, 400)
          end
        end
      end

      desc '根据订单号SN搜索订单'
      params do
        requires :sn, type: String, desc: '订单编号'
      end
      get 'search', serializer: OrderSerializer, root: false do
        @order = Order.find_by_sn(params[:sn])
      end

      desc '订单结账'
      params do
        requires :order_id, type: Integer, desc: '订单ID'
      end
      get 'settle' do
        authenticate!
        waiter_or_counter!
        @order = Order.find_by_id(params[:order_id])
        if @order.blank? || @order.pendings_count > 0
          error!({ error: "订单不存在或者还有菜色未完成！" }, 400)
        else
          if @order.pending? && @order.settled
            { msg: 'ok', status: @order.status, status_text: @order.status.text }
          else
            error!({ error: "订单已经结账！" }, 400)
          end
        end
      end

      desc '订单收款'
      params do
        requires :order_id, type: Integer, desc: "订单id"
        requires :collect, type: Float, desc: "实收款"
      end
      get 'enter' do
        authenticate!
        waiter_or_counter!
        @order = Order.find_by_id(params[:order_id])
        if @order.blank? || !@order.settled?
          error!({ error: "订单不存在或者还有没有结账！" }, 400)
        else
          if @order.update_attributes(:status => "completed", :collect => params[:collect])
            { msg: 'ok', collect: @order.collect, status: @order.status, status_text: @order.status.text }
          else
            error!({ error: "订单更新错误！" }, 400)
          end
        end
      end

      desc '为订单关联用户'
      params do
        requires :order_id, type: Integer, desc: '订单id'
        requires :mobile, type: Integer, desc: '用户手机'
      end
      post 'associated/user' do
        authenticate!
        waiter_or_counter!
        @user = User.find_by_mobile(params[:mobile])
        error!({ error: "用户不存在！" }, 400) if @user.blank?
        @order = Order.find_by_id(params[:order_id])
        error!({ error: "订单不存在！" }, 400) if @order.blank?
        if @order.update_attributes(:user_id => @user.id)
          { msg: 'ok', user_id: @user.id, showed: @user.showed}
        else
          error!({ error: "关联失败！" }, 400)
        end
      end

    end
  end
end
