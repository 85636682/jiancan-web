module V1
  class Products < Grape::API
    resource :products do
      desc '返回某个商铺的商品'
      params do
        requires :shop_id, type: Integer, desc: '商铺的Id'
      end
      get '', each_serializer: ProductSerializer, root: 'products' do
        @products = Product.where(:shop_id => params[:shop_id]).order("created_at ASC")
      end
    end
  end
end