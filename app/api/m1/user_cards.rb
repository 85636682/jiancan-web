module M1
  class UserCards < Grape::API
    resource :user_cards do

      desc "创建会员卡"
      params do
        requires :user_card, type: Hash do
          requires :brand_name, type: String, desc: ""
          requires :title, type: String, desc: ""
          requires :color, type: String, desc: ""
          requires :notice, type: String, desc: ""
          requires :description, type: String, desc: ""
          requires :service_phone, type: String, desc: ""
          requires :sku, type: String, desc: ""
          requires :date_info, type: String, desc: ""
        end
      end
      post "", serializer: UserCardSerializer, root: false do
        authenticate!
        @user_card = UserCard.new(params[:user_card])
        @user_card.shop_id = current_merchant.shop.id
        if @user_card.save
          render @user_card
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc "获取单一会员卡"
      params do
        requires :user_card_id, type: Integer, desc: "会员卡id"
      end
      get 'one', each_serializer: UserCardSerializer, root: false do
        authenticate!
        @user_card = UserCard.find_by_id(params[:user_card_id])
      end

      desc "更新会员卡"
      params do
        requires :user_card_id, type: Integer, desc: "会员卡id"
        requires :user_card, type: Hash do
          optional :brand_name, type: String, desc: ""
          optional :title, type: String, desc: ""
          optional :color, type: String, desc: ""
          optional :notice, type: String, desc: ""
          optional :description, type: String, desc: ""
          optional :service_phone, type: String, desc: ""
          optional :sku, type: String, desc: ""
          optional :date_info, type: String, desc: ""
          optional :logo, type: Hash, desc: ""
        end
      end
      put 'one' do
        authenticate!
        @user_card = UserCard.find_by_id(params[:user_card_id])
        error!({ error: "会员卡不存在！" }, 400) if @user_card.blank?
        if @user_card.update_attributes(params[:user_card])
          render @user_card
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc "删除会员卡"
      params do
        requires :user_card_id, type: Integer, desc: "会员卡id"
      end
      delete 'one' do
        authenticate!
        @user_card = UserCard.find_by_id(params[:user_card_id])
        error!({ error: "会员卡不存在！" }, 400) if @user_card.blank?
        if @user_card.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

    end
  end
end
