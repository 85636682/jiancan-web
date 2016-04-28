class CouponDetailSerializer < BaseSerializer
  attributes :id, :shop_id, :title, :details, :avatar, :avatar80x80, :original_price,
             :preferential_price, :created_at, :updated_at, :coupon_users_count

  
  has_one :shop, serializer: ShopSerializer

  def avatar
    object.avatar.url("320xAuto")
  end

  def avatar80x80
    object.avatar.url("80x80")
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end
end
