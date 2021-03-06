class CouponUserSerializer < BaseSerializer
  attributes :id, :coupon_id, :user_id, :used,
             :used_at, :created_at, :updated_at,
             :random_code

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
