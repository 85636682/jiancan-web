module V1
  class Merchants < Grape::API
    resource :merchants do
      desc "用户登录"
      params do
        requires :email   , type: String, desc: "用户登录邮箱"
        requires :password, type: String, desc: "用户登录密码"
      end
      post 'login' do
        resource = Merchant.find_by_email(params[:email])
        if resource.valid_password?(params[:password])
          { token: resource.token }
        else
          { token: "" }
        end
      end

      desc "测试"
      get 'login' do
        { token: "测试" }
      end
    end
    
  end
end