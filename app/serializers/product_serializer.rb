class ProductSerializer < BaseSerializer
  attributes :id, :name, :shop_id, :avatar, :created_at, :updated_at,
             :category_id, :sales_volume

  has_one :shop, serializer: ShopSerializer
  has_one :category, serializer: CategorySerializer

  def avatar
    object.avatar.url("80x80")
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

end
