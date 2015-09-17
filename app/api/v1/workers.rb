module V1
  class Workers < Grape::API
    resource :workers do
      desc "用户登录"
      params do
        requires :email, type: String, desc: "用户登录邮箱"
        requires :imei,  type: String, desc: "IMEI"
      end
      post 'login' do
        resource = Merchant.find_by_email(params[:email])
        if resource.blank? && (resource.shops.count < 1)
          error!({ error: "此用户和店铺不存在！" }, 400)
        else
          worker = Worker.where("imei = ? AND shop_id = ?", params[:imei], resource.shops.first.id).first
          if worker.blank?
            error!({ error: "密码不正确！" }, 401)
          else
            { msg: "登录成功！", access_token: worker.get_private_token, shop_id: resource.shops.first.id }
          end
        end
      end
    end    
  end
end