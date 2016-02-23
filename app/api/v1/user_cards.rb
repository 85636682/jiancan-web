module V1
  class UserCards < Grape::API
    resource :user_cards do

      desc "开通会员卡"
      params do
        requires :user_card_id, type: Integer, desc: "会员卡id"
        requires :mobile, type: String, desc: "用户电话号码"
      end
      post "" do
        authenticate!
        @user = User.find_by_mobile(params[:mobile])
        error!({ error: "用户不存在！" }, 400) if @user.blank?
        @user_card = UserCard.find_by_id(params[:user_card_id])
        error!({ error: "会员卡不存在！" }, 400) if @user_card.blank?
        @user_card_user = UserCardUser.new(user_card_id: @user_card.id, user_id: @user.id)
        if @user_card_user.save
          { msg: 'ok', user_card_user: @user_card_user }
        else
          error!({ error: "关联失败！" }, 400)
        end
      end

    end
  end
end
