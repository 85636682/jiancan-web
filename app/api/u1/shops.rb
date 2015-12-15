module U1
  class Shops < Grape::API
    resource :shops do
      desc '根据地理定位返回周边的店铺'
      get '', each_serializer: ShopSerializer, root: false do
        authenticate!
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
