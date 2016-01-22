module M1
  class Products < Grape::API
    resource :products do

      desc '创建菜色'
      params do
        requires :product, type: Hash do
          requires :name, type: String
          requires :price, type: Float
          optional :avatar, type: Hash
          requires :category_id, type: Integer
        end
      end
      post '', serializer: ProductSerializer, root: false do
        authenticate!
        @product = Product.new(params[:product])
        @product.shop_id = current_merchant.shop.id
        if @product.save
          render @product
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc '更新菜色'
      params do
        requires :product_id, type: Integer, desc: "菜色id"
        requires :product, type: Hash do
          optional :name, type: String
          optional :price, type: Float
          optional :avatar, type: Hash
          optional :category_id, type: Integer
        end
      end
      put 'one' do
        @product = Product.find_by_id(params[:product_id])
        error!({ error: "菜色不存在！" }, 400) if @product.blank?
        if @product.update_attributes(params[:product])
          render @product
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc '删除菜色'
      params do
        requires :product_id, type: Integer, desc: "菜色id"
      end
      delete 'one' do
        @product = Product.find_by_id(params[:product_id])
        error!({ error: "菜色不存在！" }, 400) if @product.blank?
        if @product.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

      desc '返回某个菜色'
      params do
        requires :product_id, type: Integer, desc: "菜色id"
      end
      get 'one', each_serializer: ProductSerializer, root: false do
        authenticate!
        @product = Product.find_by_id(params[:product_id])
      end

      desc '菜色月销售统计'
      params do
        requires :product_id, type: Integer, desc: '菜色id'
      end
      get 'statistic' do
        @product = Product.find_by_id(params[:product_id])
        error!({ error: "菜色不存在！" }, 400) if @product.blank?
        @totals = []
        (1..12).each do |n|
          @totals << @product.order_products.by_year.by_month(n).where("status = 'finished'").count
        end
        @totals = @totals.reverse

        #current_merchant.shop.orders.by_day(Date.today - n.days).where("status = 'settled' OR status = 'completed'").sum(:total_price).to_f()

      end

    end
  end
end
