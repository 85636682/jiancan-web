class OrderSerializer < BaseSerializer
  attributes :id, :sn, :status, :status_text, :total_price, :created_at, :updated_at,
             :room_id, :worker_id, :shop_id, :takeout, :address, :meal_time, :pay_method,
             :remarks, :pay_method_text, :mobile, :use_coupon

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def use_coupon
    false
  end

  def meal_time
    DateTime.parse(object.meal_time.iso8601).strftime('%Y年%m月%d日 %H:%M') if not object.meal_time.blank?
  end

  def status_text
    object.status.text
  end

  def pay_method_text
    object.pay_method.text
  end

end
