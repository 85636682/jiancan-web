module M1
  class Merchants < Grape::API
    resource :merchants do
      desc "用户登录"
      params do
        requires :mobile, type: String, desc: "用户手机"
        requires :password,  type: String, desc: "用户密码"
      end
      post 'login' do
        merchant = Merchant.find_by_mobile(params[:mobile])
        error!({ error: "用户和密码不正确！" }, 400)if not merchant && merchant.authenticate(params[:password])
        error!({ error: "账号未通过审核！" }, 400) if not merchant.examined
        { msg: "登录成功！", access_token: merchant.get_private_token, mobile: merchant.mobile }
      end

      desc "用户注册"
      params do
        requires :mobile, type: String, desc: "用户手机"
        requires :password, type: String, desc: "用户密码"
        requires :password_confirmation, type: String, desc: "用户密码"
      end
      post 'register' do
        merchant = Merchant.find_by_mobile(params[:mobile])
        error!({ error: "用户名已存在！" }, 400) if not merchant.blank?
        merchant = Merchant.new(:mobile => params["mobile"],
                        :password => params["password"],
                        :password_confirmation => params["password_confirmation"])
        if merchant.save
          { msg: "注册成功！", access_token: merchant.get_private_token, mobile: merchant.mobile }
        else
          error!({ error: "用户注册失败！" }, 400)
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
          optional :mobile, type: String, desc: "手机"
          optional :name, type: String, desc: "名称"
        end
      end
      put 'current' do
        authenticate!
        if current_merchant.update_attributes(params["merchant"])
          render current_merchant
        else
          error!({ error: "用户信息修改失败！"}, 400)
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
          error!({ error: "用户密码修改失败！"}, 400)
        end
      end

    end
  end
end
