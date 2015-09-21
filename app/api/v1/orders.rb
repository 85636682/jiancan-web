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

      desc '给订单添加商品'
      params do
        requires :order_id, type: Integer, desc: '订单的id'
        requires :products_quantity, type: Array[Integer], desc: '包含所有添加商品id的整形数组，用商品的id作为key，用所选商品的数据作为value'
      end
      post 'products' do
        authenticate!
        @order = Order.find(params[:order_id])
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

      desc '根据订单号SN搜索订单'
      params do
        requires :sn, type: String, desc: '订单编号'
      end
      get 'search' do
        @order = Order.find_by_sn(params[:sn])
      end

    end
  end
end