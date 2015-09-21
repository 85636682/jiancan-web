class OrderSerializer < BaseSerializer
  attributes :id, :created_at, :updated_at, :room_id, :room, :worker_id, :worker, :products

  def room
    RoomSerializer.new(object.room, root: false)
  end

  def worker
    WorkerSerializer.new(object.worker, root: false)
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end
end