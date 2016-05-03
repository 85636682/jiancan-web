class RoomSerializer < BaseSerializer
  attributes :id, :name, :seat, :shop_id, :current_order

  def current_order
    Order.find_by(:room_id => object.id, :status => 'pending')
  end
end
