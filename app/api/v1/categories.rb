module V1
  class Categories < Grape::API
    resource :categories do
      desc '获取某店铺下所有商品'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get ':id/products', each_serializer: ProductSerializer, root: 'products' do
        @category = Category.find(params[:id])
        @products = @category.products.offset(params[:offset]).limit(params[:limit]).order("id ASC")
      end

      desc '返回某个商铺的分类'
      params do
        requires :shop_id, type: Integer, desc: '商铺的Id'
      end
      get '', each_serializer: CategorySerializer, root: 'categories' do
        @categories = Category.where(:shop_id => params[:shop_id]).order("created_at ASC")
      end
    end
  end
end