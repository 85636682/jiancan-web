module V1
  class Merchants < Grape::API
    resource :merchants do
      desc "用户登录"
      params do
        requires :email   , type: String, desc: "用户登录邮箱"
        requires :password, type: String, desc: "用户登录密码"
      end
      post 'login' do
        msg = token = ""
        resource = Merchant.find_by_email(params[:email])
        if resource.blank?
          msg = "此用户不存在！"
        else
          if resource.valid_password?(params[:password])
            msg = "登录成功！"
            token = resource.private_token
          else
            msg = "密码不正确！"
          end
        end
        { msg: msg, token: token}
      end

      desc "测试"
      get 'login' do
        { token: "测试" }
      end
    end
    
  end
end