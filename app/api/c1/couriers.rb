module C1
  class Couriers < Grape::API
    resource :couriers do
      desc "快递员登录"
      params do
        requires :login, type: String, desc: "快递员账号"
        requires :password,  type: String, desc: "快递员密码"
      end
      post 'login' do
        courier = Courier.find_by_login(params[:login])
        if courier && courier.authenticate(params[:password])
          { msg: "登录成功！", login: courier.login, access_token: courier.get_private_token, pusher_id: courier.pusher_id }
        else
          error!({ error: "用户和密码不正确！" }, 400)
        end
      end

      desc "当前快递员信息"
      params do
      end
      get 'current', serializer: CourierSerializer, root: false do
        authenticate!
        render current_courier
      end

      desc '简餐配送的订单'
      params do
        optional :offset, type: Integer, default: 0
        optional :limit,  type: Integer, default: 20, values: 1..150
      end
      get 'express', each_serializer: OrderDetailSerializer, root: false  do
        authenticate!
        @orders = current_courier.orders.offset(params[:offset]).limit(params[:limit]).order("created_at DESC")
      end

    end
  end
end
