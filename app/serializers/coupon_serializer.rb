class CouponSerializer < BaseSerializer
  attributes :id, :title, :details, :avatar, :original_price,
             :preferential_price, :created_at, :updated_at

  has_many :coupon_users, serializer: CouponUserSerializer

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end
end
