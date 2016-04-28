class CouponUserDetailSerializer < BaseSerializer
  attributes :id, :coupon_id, :user_id, :used,
             :used_at, :created_at, :updated_at

  has_one :coupon, serializer: CouponSerializer
  has_one :user, serializer: UserSerializer

  def used_at
    DateTime.parse(object.used_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end
end
