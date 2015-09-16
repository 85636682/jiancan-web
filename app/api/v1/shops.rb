module V1
  class Shops < Grape::API
    resource :shops do

      desc '获取某店铺下所有分类'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'categories', each_serializer: CategorySerializer, root: 'categories' do
        @shop = Shop.find(params[:id])
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

    end
  end
end