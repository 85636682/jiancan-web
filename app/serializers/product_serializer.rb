class ProductSerializer < BaseSerializer
  attributes :id, :name, :shop_id, :shop, :avatar, :created_at, :updated_at,
             :category_id, :category

  def avatar
    object.avatar.url("80x80")
  end

  def shop
    ShopSerializer.new(object.shop, root: false)
  end

  def category
    CategorySerializer.new(object.category, root: false)
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

end
