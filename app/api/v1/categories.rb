module V1
  class Categories < Grape::API
    desc '获取某店铺下所有商品'
    params do
      optional :offset, type: Integer, default: 0
      optional :limit,  type: Integer, default: 20, values: 1..150
    end
    get 'products', each_serializer: ProductSerializer, root: 'products' do
      @category = Category.find(params[:id])
      @products = @category.products.offset(params[:offset]).limit(params[:limit]).order("id ASC")
    end
  end
end