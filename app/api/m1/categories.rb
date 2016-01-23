module M1
  class Categories < Grape::API
    resource :categories do

      desc '创建分类'
      params do
        requires :category, type: Hash do
          requires :name, type: String
        end
      end
      post '', serializer: CategorySerializer, root: false do
        authenticate!
        @category = Category.new(params[:category])
        @category.shop_id = current_merchant.shop.id
        if @category.save
          render @category
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc '更新分类'
      params do
        requires :category_id, type: Integer, desc: "分类id"
        requires :category, type: Hash do
          requires :name, type: String
        end
      end
      put 'one' do
        @category = Category.find_by_id(params[:category_id])
        error!({ error: "分类不存在！" }, 400) if @category.blank?
        if @category.update_attributes(params[:category])
          render @category
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc '删除分类'
      params do
        requires :category_id, type: Integer, desc: "分类id"
      end
      delete 'one' do
        @category = Category.find_by_id(params[:category_id])
        error!({ error: "分类不存在！" }, 400) if @category.blank?
        if @category.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

      desc '返回某个分类'
      params do
        requires :category_id, type: Integer, desc: "分类id"
      end
      get 'one', each_serializer: CategorySerializer, root: false do
        authenticate!
        @category = Category.find_by_id(params[:category_id])
      end

      desc '返回某个分类下的菜色'
      params do
        requires :category_id, type: Integer, desc: "分类id"
      end
      get 'products', each_serializer: ProductSerializer, root: false do
        authenticate!
        @category = Category.find_by_id(params[:category_id])
        error!({ error: "分类不存在！" }, 400) if @category.blank?
        render @category.products
      end
    end
  end
end
