module U1
  class Products < Grape::API
    resource :products do
      desc "获取单一商品"
      params do
        requires :product_id, type: Integer, desc: "商品id"
      end
      get 'one', serializer: ProductDetailSerializer, root: false do
        @product = Product.find_by_id(params[:product_id])
      end
    end
  end
end
