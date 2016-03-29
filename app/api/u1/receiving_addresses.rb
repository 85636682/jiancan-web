module U1
  class ReceivingAddresses < Grape::API
    resource :receiving_addresses do
      desc "获取用户的收货地址"
      params do
      end
      get '', each_serializer: ReceivingAddressSerializer, root: false do
        authenticate!
        @receiving_addresses = current_user.receiving_addresses
      end

      desc "添加用户的收货地址"
      params do
        requires :address, type: Hash do
          requires :consignee, type: String, desc: "收货人"
          requires :mobile,  type: String, desc: "收货人电话"
          optional :province,  type: String, desc: "省份"
          optional :city,  type: String, desc: "城市"
          optional :district,  type: String, desc: "区／县"
          requires :street,  type: String, desc: "街道地址"
        end
      end
      post '', serializer: ReceivingAddressSerializer, root: false do
        authenticate!
        @receiving_address = ReceivingAddress.new(params[:address])
        @receiving_address.user_id = current_user.id
        if @receiving_address.save
          render @receiving_address
        else
          error!({ error: "地址保存失败！" }, 400)
        end
      end

    end
  end
end
