class ProductSerializer < BaseSerializer
  attributes :id, :name, :shop_id, :avatar, :created_at, :updated_at,
             :category_id, :sales_volume, :price

  has_one :category

  def avatar
    object.avatar.url("320xAuto")
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

end
