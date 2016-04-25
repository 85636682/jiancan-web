class ProductSerializer < BaseSerializer
  attributes :id, :name, :shop_id, :avatar, :created_at, :updated_at,
             :category_id, :sales_volume, :price, :avatar80x80, :orders_by_month_count,
             :recommend

  has_one :category
  has_many :order_products, serializer: OrderProductSerializer

  def avatar
    object.avatar.url("320xAuto")
  end

  def avatar80x80
    object.avatar.url("80x80")
  end

  def orders_by_month_count
    object.order_products.by_month.count
  end

  def comments
    object.joins(:order_products).where()
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

end
