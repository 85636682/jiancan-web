module V1
  class Workers < Grape::API
    resource :workers do
      desc "用户登录"
      params do
        requires :email, type: String, desc: "用户登录邮箱"
        requires :imei,  type: String, desc: "IMEI"
      end
      post 'login' do
        msg = token = ""
        resource = Merchant.find_by_email(params[:email])
        if resource.blank? && (resource.shops.count < 1)
          msg = "此用户和店铺不存在！"
        else
          worker = Worker.where("imei = ? && shop_id = ?", params[:imei], resource.shops.first.id)
          if worker.blank?
            msg = "密码不正确！"
          else
            msg = "登录成功！"
            token = worker.get_private_token
          end
        end
        { msg: msg, token: token, shop_id: shop_id }
      end

    end    
  end
end