module M1
  class Merchants < Grape::API
    resource :merchants do
      desc "用户登录"
      params do
        requires :email, type: String, desc: "用户邮箱"
        requires :password,  type: String, desc: "用户密码"
      end
      post 'login' do
        merchant = Merchant.find_by_email(params[:email])
        if merchant && merchant.authenticate(params[:password])
          { msg: "登录成功！", access_token: merchant.get_private_token, email: merchant.email }
        else
          error!({ error: "用户和密码不正确！" }, 401)
        end
      end

      desc "用户注册"
      params do
        requires :email, type: String, desc: "用户邮箱"
        requires :password, type: String, desc: "用户密码"
        requires :password_confirmation, type: String, desc: "用户密码"
      end
      post 'register' do
        merchant = Merchant.find_by_email(params[:email])
        error!({ error: "用户名已存在！" }, 401) if not merchant.blank?
        merchant = Merchant.new(:email => params["email"],
                        :password => params["password"],
                        :password_confirmation => params["password_confirmation"])
        if merchant.save
          { msg: "注册成功！", access_token: merchant.get_private_token, email: merchant.email }
        else
          error!({ error: "用户注册失败！" }, 401)
        end
      end

      desc "当前用户信息"
      params do
      end
      get 'current', serializer: MerchantSerializer, root: false do
        authenticate!
        current_merchant
      end

      desc "修改当前用户信息"
      params do
        requires :update_key, type: String, desc: "要修改的字段的名称"
        requires :update_value, type: String, desc: "要修改的字段的内容"
      end
      put 'current' do
        authenticate!
        if current_merchant.update_attributes(params["update_key"].to_sym => params[:update_value])
          { msg: "ok", params["update_key"].to_sym => params[:update_value] }
        else
          error!({ error: "用户信息修改失败！"}, 401)
        end
      end

    end
  end
end
