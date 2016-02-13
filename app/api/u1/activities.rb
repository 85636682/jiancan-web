module U1
  class Activities < Grape::API
    resource :activities do
      desc "活动点赞"
      params do
        requires :activity_id, type: Integer, desc: "活动id"
        requires :user_id, type: Integer, desc: "用户id"
      end
      put 'likes' do
        authenticate!
        @activity_user = ActivityUser.where(activity_id: params[:activity_id], user_id: params[:user_id]).first
        error!({ error: "活动不存在！" }, 401) if @activity_user.blank?
        if @activity_user.liked_users.present? && @activity_user.liked_users.include?(current_user.id)
          { likes: @activity_user.likes }
        else
          if @activity_user.update_attributes(likes: @activity_user.likes + 1, liked_users: @activity_user.liked_users + [ current_user.id ])
            { likes: @activity_user.likes }
          else
            error!({ error: "用户信息修改失败！"}, 401)
          end
        end
      end
    end
  end
end
