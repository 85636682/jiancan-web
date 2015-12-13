module U1
  class ReceivingAddresses < Grape::API
    resource :receiving_addresses do
      desc "获取用户的收货地址"
      params do
      end
      get '', each_serializer: ReceivingAddressSerializer, root: false  do
        authenticate!
        @receiving_addresses = current_user.receiving_addresses
      end

      desc "添加用户的收货地址"
      params do
        requires :consignee, type: String, desc: "收货人"
        requires :mobile,  type: String, desc: "收货人电话"
        requires :province,  type: String, desc: "省份"
        requires :city,  type: String, desc: "城市"
        requires :district,  type: String, desc: "区／县"
        requires :street,  type: String, desc: "街道地址"
      end
      post '' do
        authenticate!
        @receiving_address = ReceivingAddress.new(:consignee => params[:consignee],
                                                  :mobile => params[:mobile],
                                                  :province => params[:province],
                                                  :city => params[:city],
                                                  :district => params[:district],
                                                  :street => params[:street],
                                                  :user_id => current_user.id)
        if @receiving_address.save
          { msg: 'ok', receiving_address: @receiving_address }
        else
          error!({ error: "地址保存失败！" }, 401)
        end
      end

    end
  end
end
