module V1
  class Products < Grape::API
    resource :products do
      desc '返回所有的商品'
      params do
        requires :shop_id, type: Integer, desc: '商铺的Id'
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get '', each_serializer: ProductSerializer, root: false do
        @products = Product.all.offset(params[:offset]).limit(params[:limit]).order("created_at ASC")
      end
    end
  end
end
