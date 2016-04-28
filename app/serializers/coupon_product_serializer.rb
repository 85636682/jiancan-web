class CouponProductSerializer < BaseSerializer
  attributes :id, :coupon_id, :product_id, :amount, :created_at, :updated_at

  has_one :product

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end
end
