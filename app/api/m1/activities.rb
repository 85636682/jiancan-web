module M1
  class Activities < Grape::API
    resource :activities do

      desc '返回某个活动'
      params do
        requires :activity_id, type: Integer, desc: "活动id"
      end
      get 'one', serializer: ActivitySerializer, root: false do
        authenticate!
        @activity = Activity.find_by_id(params[:activity_id])
      end

      desc "创建活动"
      params do
        requires :activity, type: Hash do
          requires :title, type: String
          requires :details, type: String
          optional :deadline, type: DateTime
          requires :likes, type: Integer
          requires :handle, type: String
          requires :amount, type: Integer
        end
      end
      post "", serializer: ActivitySerializer, root: false do
        authenticate!
        @activity = Activity.new(params[:activity])
        @activity.shop_id = current_merchant.shop.id
        if @activity.save
          render @activity
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc "更新活动"
      params do
        requires :activity_id, type: Integer, desc: "活动id"
        requires :activity, type: Hash do
          optional :title, type: String
          optional :details, type: String
          optional :deadline, type: DateTime
          optional :likes, type: Integer
          optional :handle, type: String
          optional :amount, type: Integer
        end
      end
      put 'one', serializer: ActivitySerializer, root: false do
        @activity = Activity.find_by_id(params[:activity_id])
        error!({ error: "分类不存在！" }, 400) if @activity.blank?
        if @activity.update_attributes(params[:activity])
          render @activity
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc "删除活动"
      params do
        requires :activity_id, type: Integer, desc: "活动id"
      end
      delete 'one' do
        @activity = Activity.find_by_id(params[:activity_id])
        error!({ error: "活动不存在！" }, 400) if @activity.blank?
        if @activity.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

      desc "添加活动商品"
      params do
        requires :activity_id, type: Integer, desc: '活动的id'
        requires :products, type: Array[String], desc: '商品id数组'
      end
      post "products", each_serializer: ProductSerializer, root: false do
        authenticate!
        @activity = Activity.find_by_id(params[:activity_id])
        if @activity.blank?
          error!({ error: "活动不存在！" }, 400)
        else
          begin
            ActiveRecord::Base.transaction do
              products.each do |value|
                next if value.to_i < 1
                product = Product.find_by_id(value)
                if not product.blank?
                  activity_product = ActivityProduct.where(:activity_id => @activity.id, :product_id => product.id).first
                  if activity_product.blank?
                    activity_product = ActivityProduct.create!(:activity_id => @activity.id, :product_id => product.id, :amount => 1)
                  else
                    amount = activity_product.amount + 1
                    activity_product.update_attributes!(:amount => amount)
                  end
                end
              end
            end
            render @activity
          rescue Exception => e
            JcLog.create(:content=>e.message)
            error!({ error: "商品失效，导致添加失败！" }, 400)
          end

        end
      end

      desc "删除活动商品"
      params do

      end
      delete "products", each_serializer: ProductSerializer, root: false do

      end
    end
  end
end
