module M1
  class Workers < Grape::API
    resource :workers do

      desc '创建员工'
      params do
        requires :worker, type: Hash do
          requires :name, type: String, desc: "员工名称"
          requires :login, type: String, desc: "员工账号"
          requires :department, type: String, desc: "员工部门"
          requires :password, type: String, desc: "密码"
          requires :password_confirmation, type: String, desc: "密码确认"
        end
      end
      post '', serializer: WorkerSerializer, root: false do
        authenticate!
        @worker = Worker.new(params[:worker])
        @worker.shop_id = current_merchant.shop.id
        if @worker.save
          render @worker
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc '更新员工'
      params do
        requires :worker_id, type: Integer, desc: "员工id"
        requires :worker, type: Hash do
          optional :name, type: String, desc: "员工名称"
          optional :login, type: String, desc: "员工账号"
          optional :department, type: String, desc: "员工部门"
          optional :password, type: String, desc: "密码"
          optional :password_confirmation, type: String, desc: "密码确认"
        end
      end
      put 'one', serializer: WorkerSerializer, root: false do
        @worker = Worker.find_by_id(params[:worker_id])
        error!({ error: "员工不存在！" }, 400) if @worker.blank?
        if @worker.update_attributes(params[:worker])
          render @worker
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc '删除员工'
      params do
        requires :worker_id, type: Integer, desc: "员工id"
      end
      delete 'one' do
        @worker = Worker.find_by_id(params[:worker_id])
        error!({ error: "员工不存在！" }, 400) if @worker.blank?
        if @worker.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

      desc '返回某个员工'
      params do
        requires :worker_id, type: Integer, desc: "员工id"
      end
      get 'one', serializer: WorkerSerializer, root: false do
        authenticate!
        @worker = Worker.find_by_id(params[:worker_id])
      end
    end
  end
end
