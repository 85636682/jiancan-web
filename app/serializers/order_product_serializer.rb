class OrderProductSerializer < BaseSerializer
  attributes :id, :order_id, :order_sn, :product_id, :quantity, :status,
             :status_text, :created_at, :updated_at

  has_one :product, serializer: ProductSerializer
  has_one :comment, serializer: CommentSerializer

  def order_sn
    object.order.sn
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
