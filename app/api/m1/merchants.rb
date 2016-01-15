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
        requires :merchant, type: Hash do
          optional :email, type: String, desc: "邮箱"
          optional :name, type: String, desc: "名称"
        end
      end
      put 'current' do
        authenticate!
        if current_merchant.update_attributes(params["merchant"])
          render current_merchant
        else
          error!({ error: "用户信息修改失败！"}, 401)
        end
      end

      desc "修改当前用户密码"
      params do
        requires :merchant, type: Hash do
          requires :password, type: String, desc: "新密码"
          requires :password_confirmation, type: String, desc: "新密码确认"
          requires :current_password, type: String, desc: "当前密码"
        end
      end
      put 'current/password' do
        authenticate!
        if merchant.authenticate(params[:current_password]) && current_merchant.update_attributes(params["merchant"])
          render current_merchant
        else
          error!({ error: "用户密码修改失败！"}, 401)
        end
      end

    end
  end
end
