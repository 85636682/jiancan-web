module V1
  class Workers < Grape::API
    resource :workers do
      desc "用户登录"
      params do
        requires :login, type: String, desc: "员工账号"
        requires :password,  type: String, desc: "员工密码"
      end
      post 'login' do
        worker = Worker.find_by_login(params[:login])
        if worker && worker.authenticate(params[:password])
          { msg: "登录成功！", login: worker.login, access_token: worker.get_private_token, pusher_id: worker.pusher_id }
        else
          error!({ error: "用户和密码不正确！" }, 400)
        end
      end

      desc "当前员工信息"
      params do
      end
      get 'current', serializer: WorkerSerializer, root: false do
        authenticate!
        render current_worker
      end

    end
  end
end
