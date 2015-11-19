class OrderSerializer < BaseSerializer
  attributes :id, :sn, :status, :status_text, :total_price, :created_at, :updated_at, :room_id, :worker_id, :shop_id

  has_many :order_products, serializer: OrderProductSerializer
  has_one :room, serializer: RoomSerializer
  has_one :shop, serializer: ShopSerializer
  has_one :worker, serializer: WorkerSerializer

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
