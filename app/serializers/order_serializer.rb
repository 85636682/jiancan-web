class OrderSerializer < BaseSerializer
  attributes :id, :sn, :status, :status_text, :total_price, :created_at, :updated_at, :room_id, :room, :worker_id, :worker, :shop_id, :shop

  has_many :order_products, serializer: OrderProductSerializer

  def room
    RoomSerializer.new(object.room, root: false)
  end

  def worker
    WorkerSerializer.new(object.worker, root: false)
  end

  def shop
    ShopSerializer.new(object.shop, root: false)
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def status_text
    object.status.text
  end

end
