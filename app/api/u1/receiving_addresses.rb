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

      desc '设置默认收货地址'
      params do
        requires :address_id, type: Integer
      end
      put 'default', serializer: ReceivingAddressSerializer, root: false do
        authenticate!
        begin
          ActiveRecord::Base.transaction do
            @receiving_addresses = current_user.receiving_addresses
            @receiving_addresses.each do |address|
              if address.id == params[:address_id]
                address.update_attributes(:defaulted => true)
              else
                address.update_attributes(:defaulted => false)
              end
            end
          end
          render @receiving_addresses
        rescue Exception => e
          error!({ error: "默认地址设置失败！" }, 400)
        end
      end

    end
  end
end
