module M1
  class Shops < Grape::API
    resource :shops do

      desc '创建店铺'
      params do
        requires :shop, type: Hash do
          requires :name, type: String, desc: "店铺名称"
          requires :province, type: String, desc: "店铺省份"
          requires :city, type: String, desc: "店铺城市"
          requires :district, type: String, desc: "店铺县区"
          requires :street, type: String, desc: "店铺街道"
          requires :mobile, type: String, desc: "店铺电话"
          requires :meals, type: Array[String], desc: ""
          optional :avatar, type: Hash, desc: "店铺头像"
        end
      end
      post '', serializer: ShopSerializer, root: false do
        authenticate!
        @shop = Shop.new(params[:shop])
        @shop.merchant_id = current_merchant.id
        if @shop.save
          render @shop
        else
          error!({ error: "创建失败！" }, 400)
        end
      end

      desc '修改店铺'
      params do
        requires :shop, type: Hash do
          optional :name, type: String, desc: "店铺名称"
          optional :province, type: String, desc: "店铺省份"
          optional :city, type: String, desc: "店铺城市"
          optional :district, type: String, desc: "店铺县区"
          optional :street, type: String, desc: "店铺街道"
          optional :mobile, type: String, desc: "店铺电话"
          optional :meals, type: Array[String], desc: ""
          optional :avatar, type: Hash, desc: "店铺头像"
          optional :full_free_courier, type: Integer, desc: "满额免运费"
        end
      end
      put 'one' do
        authenticate!
        error!({ error: "店铺不存在！" }, 400) if current_merchant.shop.blank?
        if current_merchant.shop.update_attributes(params[:shop])
          current_merchant.shop.update_location
          render current_merchant.shop
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc '返回当前用户所关联的店铺信息，用于非登录页面'
      get 'current', serializer: ShopSerializer, root: false do
        authenticate!
        render current_merchant.shop
      end

      desc '获取店铺下所有分类'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'categories', each_serializer: CategorySerializer, root: false do
        authenticate!
        @categories = Category.where(:shop_id => current_merchant.shop.id).offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

      desc '获取店铺下所有台桌'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'rooms', each_serializer: RoomSerializer, root: false do
        authenticate!
        @rooms = Room.where(:shop_id => current_merchant.shop.id).offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

      desc '获取店铺下所有商品'
      params do
      end
      get 'products', each_serializer: ProductSerializer, root: false do
        authenticate!
        @products = Product.where(:shop_id => current_merchant.shop.id).order("id ASC")
      end

      desc '返回店铺下所有订单'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'orders', each_serializer: OrderDetailSerializer, root: false do
        authenticate!
        @orders = Order.where(:shop_id => current_merchant.shop.id).offset(params[:offset]).limit(params[:limit]).order("created_at DESC")
        render @orders
      end

      desc '返回店铺下所有员工'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'workers', each_serializer: WorkerSerializer, root: false do
        authenticate!
        @workers = Worker.where(:shop_id => current_merchant.shop.id).offset(params[:offset]).limit(params[:limit]).order("id ASC")
        render @workers
      end

      desc '返回店铺下所有优惠劵'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'coupons', each_serializer: CouponSerializer, root: false do
        authenticate!
        @coupons = Coupon.where(:shop_id => current_merchant.shop.id).offset(params[:offset]).limit(params[:limit]).order("id ASC")
        render @coupons
      end

      desc "店铺销售量分析"
      params do

      end
      get 'statistic' do
        authenticate!
        error!({ error: "店铺不存在！" }, 400) if @current_merchant.shop.blank?
        @totals = []
        (1..12).each do |n|
          @totals << @current_merchant.shop.orders.by_month(n, :year => Time.now.year).where("status = 'completed'").sum(:total_price)
        end
        @totals
      end

    end
  end
end
