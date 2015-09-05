class OrderSerializer < BaseSerializer
  attributes :id, :created_at, :updated_at, :room_id, :room, :products

  def room
    RoomSerializer.new(object.room, root: false)
  end
end