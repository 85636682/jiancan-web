module V1
  class Shops < Grape::API
    resource :shops do

      desc '获取某店铺下所有分类'
      params do
        requires :shop_id, type: Integer
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'categories', each_serializer: CategorySerializer, root: 'categories' do
        @shop = Shop.find(params[:shop_id])
        @categories = @shop.categories.offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

      desc '获取某店铺下所有商品'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'products', each_serializer: ProductSerializer, root: 'products' do
        @shop = Shop.find(params[:id])
        @products = @shop.products.offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

      desc '返回某店铺下所有订单'
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

      desc '获取某店铺下所有订单的菜色'
      params do
        requires :status, type: Symbol, values: [:pending, :settled, :completed, :canceled], default: :pending, desc: "pending 订单消费状态  settled订单结算状态  completed 订单完成支付  canceled订单取消"
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'orders_products', each_serializer: OrderProductSerializer, root: 'orders_products' do
        authenticate!
        @orders_products = OrderProduct.joins(:order).where("orders.shop_id = ?", @current_worker.shop_id).order("created_at DESC")
        render @orders_products
      end
    end
  end
end
