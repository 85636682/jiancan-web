module M1
  class Rooms < Grape::API
    resource :rooms do

      desc '创建台桌'
      params do
        requires :room, type: Hash do
          requires :name, type: String
          requires :seat, type: Integer
        end
      end
      post '', serializer: RoomSerializer, root: false do
        authenticate!
        @room = Room.new(params[:room])
        @room.shop_id = current_merchant.shop.id
        if @room.save
          render @room
        else
          error!({ error: "保存失败！" }, 400)
        end
      end

      desc '更新台桌'
      params do
        requires :room_id, type: Integer, desc: "台桌id"
        requires :room, type: Hash do
          requires :name, type: String
          requires :seat, type: Integer
        end
      end
      put 'one' do
        @room = Room.find_by_id(params[:room_id])
        error!({ error: "分类不存在！" }, 400) if @room.blank?
        if @room.update_attributes(params[:room])
          render @room
        else
          error!({ error: "更新失败！" }, 400)
        end
      end

      desc '删除台桌'
      params do
        requires :room_id, type: Integer, desc: "台桌id"
      end
      delete 'one' do
        @room = Room.find_by_id(params[:room_id])
        error!({ error: "台桌不存在！" }, 400) if @room.blank?
        if @room.destroy
          { msg: 'ok' }
        else
          error!({ error: "删除失败！" }, 400)
        end
      end

      desc '返回某个台桌'
      params do
        requires :room_id, type: Integer, desc: "台桌id"
      end
      get 'one', each_serializer: RoomSerializer, root: false do
        authenticate!
        @room = Room.find_by_id(params[:room_id])
      end
    end
  end
end
