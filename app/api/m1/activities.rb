module M1
  class Activities < Grape::API
    resource :activities do

      desc "创建活动"
      params do
        requires :activity, type: Hash do
          requires :title, type: String
          requires :details, type: String
          requires :deadline, type: DateTime
          requires :likes, type: Integer
          requires :handle, type: String
          requires :amount, type: Integer
        end
      end
      post "", each_serializer: ActivitySerializer, root: false do
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
      put 'one', each_serializer: ActivitySerializer, root: false do
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
      delete 'one', each_serializer: ActivitySerializer, root: false do
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
        
      end
      post "products", each_serializer: ProductSerializer, root: false do

      end

      desc "删除活动商品"
      params do

      end
      delete "products", each_serializer: ProductSerializer, root: false do

      end
    end
  end
end
