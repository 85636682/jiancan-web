module U1
  class Categories < Grape::API
    resource :categories do
      desc '获取某分类下所有商品'
      params do
        requires :category_id, type: Integer
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'products', each_serializer: ProductSerializer, root: false do
        @category = Category.find_by_id(params[:category_id])
        if @category.blank?
          error!({ error: "分类不存在！" }, 400)
        else
          @products = @category.products.offset(params[:offset]).limit(params[:limit]).order("id ASC")
        end
      end

      desc '返回某个商铺的分类'
      params do
        requires :shop_id, type: Integer, desc: '商铺的Id'
      end
      get '', each_serializer: CategorySerializer, root: false do
        @categories = Category.where(:shop_id => params[:shop_id]).order("sort ASC")
      end
    end
  end
end
