module U1
  class Shops < Grape::API
    resource :shops do
      desc '根据地理定位返回周边的店铺'
      params do
        requires :lat, type: Float, desc: ""
        requires :lng, type: Float, desc: ""
      end
      get '', each_serializer: ShopSerializer, root: false do
        authenticate!
        @shops = Shop.select("shops.*, st_distance(location, 'point(#{params[:lng]} #{params[:lat]})') as distance")
            .where("st_dwithin(location, 'point(#{params[:lng]} #{params[:lat]})', 10000)").order("distance")
        # 查找10公里 内结果， 并按照距离进行排序
        render @shops
      end

      desc '获取某店铺下所有分类'
      params do
        requires :shop_id, type: Integer, desc: '店铺id'
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'categories', each_serializer: CategorySerializer, root: false do
        authenticate!
        @categories = Category.where(:shop_id => params[:shop_id]).offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

      desc '获取某店铺下所有商品'
      params do
        requires :shop_id, type: Integer, desc: '店铺id'
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'products', each_serializer: ProductSerializer, root: false do
        authenticate!
        @products = Product.where(:shop_id => params[:shop_id]).offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

    end
  end
end
