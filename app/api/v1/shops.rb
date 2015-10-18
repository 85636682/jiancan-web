module V1
  class Shops < Grape::API
    resource :shops do
      desc '返回当前用户所关联的店铺信息，用于非登录页面'
      get 'current', serializer: ShopSerializer, root: 'shop' do
        authenticate!
        render current_worker.shop
      end

      desc '获取店铺下所有分类'
      params do
        requires :shop_id, type: Integer
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'categories', each_serializer: CategorySerializer, root: 'categories' do
        @shop = Shop.find_by_id(params[:shop_id])
        if @shop.blank?
          error!({ error: "店铺不存在！" }, 400)
        else
          @categories = @shop.categories.offset(params[:offset]).limit(params[:limit]).order("id ASC")
        end
      end

      desc '获取店铺下所有台桌'
      params do
        requires :shop_id, type: Integer
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'rooms', each_serializer: RoomSerializer, root: 'rooms' do
        @shop = Shop.find_by_id(params[:shop_id])
        if @shop.blank?
          error!({ error: "店铺不存在！" }, 400)
        else
          @rooms = @shop.rooms.offset(params[:offset]).limit(params[:limit]).order("id ASC")
        end
      end

      desc '获取店铺下所有商品'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'products', each_serializer: ProductSerializer, root: 'products' do
        @shop = Shop.find_by_id(params[:id])
        if @shop.blank?
          error!({ error: "店铺不存在！" }, 400)
        else
          @products = @shop.products.offset(params[:offset]).limit(params[:limit]).order("id ASC")
        end
      end

      desc '返回店铺下所有订单'
      params do
        requires :shop_id, type: Integer, desc: '店铺的Id'
        requires :status, type: Symbol, values: [:pending, :settled, :completed, :canceled], default: :pending, desc: "pending 订单消费状态  settled订单结算状态  completed 订单完成支付  canceled订单取消"
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'orders', each_serializer: OrderSerializer, root: 'orders' do
        authenticate!
        @orders = Order.where("shop_id = ? AND status = ?", params[:shop_id], params[:status]).offset(params[:offset]).limit(params[:limit]).order("created_at DESC")
        render @orders
      end

      desc '获取店铺下所有订单的菜色'
      params do
        requires :status, type: Symbol, values: [:pending, :cooking, :finished, :canceled], default: :pending, desc: "订单菜色的状态"
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'order_products', each_serializer: OrderProductSerializer, root: 'order_products' do
        authenticate!
        @order_products = OrderProduct.joins(:order).where("orders.shop_id = ? AND orders.status = 'pending'", @current_worker.shop_id).order("created_at DESC")
        render @order_products
      end

      desc '更新店铺下某订单的菜色'
      params do
        requires :order_product_id, type: Integer, desc: "订单菜色的ID"
        requires :status, type: Symbol, values: [:pending, :cooking, :finished, :canceled], desc: "订单菜色的状态"
      end
      put 'order_products', serializer: OrderProductSerializer, root: 'OrderProduct' do
        authenticate!
        @order_product = OrderProduct.find_by_id(params[:order_product_id])
        if @order_product.blank?
          error!({ error: "该订单不存在此菜色！" }, 400)
        else
          if @order_product.update(:status => params[:status])
            render @order_product
          else
            error!({ error: "更新失败！" }, 400)
          end
        end
      end
    end
  end
end
