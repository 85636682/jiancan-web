class OrderDetailSerializer < BaseSerializer
  attributes :id, :sn, :status, :status_text, :total_price, :total_fee, :created_at, :updated_at,
             :room_id, :worker_id, :shop_id, :takeout, :address, :meal_time, :pay_method,
             :remarks, :pay_method_text, :mobile, :use_coupon, :send_method, :send_method_text,
             :expressed

  has_many :order_products, serializer: OrderProductSerializer
  has_one :room, serializer: RoomSerializer
  has_one :shop, serializer: ShopSerializer
  has_one :worker, serializer: WorkerSerializer
  has_one :user, serializer: UserSerializer
  has_one :coupon_user,   serializer: CouponUserSerializer
  has_one :courier, serializer: CourierSerializer

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def total_fee
    object.total_fee
  end

  def use_coupon
    !object.coupon_user.blank?
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

  def send_method_text
    object.send_method.text
  end

end
