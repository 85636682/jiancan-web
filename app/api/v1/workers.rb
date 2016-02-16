module V1
  class Workers < Grape::API
    resource :workers do
      desc "用户登录"
      params do
        requires :login, type: String, desc: "员工账号"
        requires :password,  type: String, desc: "员工密码"
        requires :department, type: String, desc: "部门waiter||kitchen||counter"
      end
      post 'login' do
        worker = Worker.find_by_login(params[:login])
        if worker && worker.authenticate(params[:password])
          if worker.department == params[:department]
            { msg: "登录成功！", access_token: worker.get_private_token, pusher_id: worker.pusher_id }
          else
            error!({ error: "用户不属于这个部门！" }, 400)
          end
        else
          error!({ error: "用户和密码不正确！" }, 400)
        end
      end
    end
  end
end
