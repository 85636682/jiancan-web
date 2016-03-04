class OrderProductSerializer < BaseSerializer
  attributes :id, :order_id, :order_sn, :product_id, :quantity, :status,
             :status_text, :status_action, :created_at, :updated_at

  has_one :product, serializer: ProductSerializer

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

  def status_action
    case object.status
    when :pending
      "出单"
    when :cooking
      "上菜"
    when :finished
      "完成"
    end
  end
end
