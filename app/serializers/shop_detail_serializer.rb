class ShopDetailSerializer < BaseSerializer
  attributes :id, :name, :street, :mobile, :province, :city, :district, :avatar,
             :created_at, :updated_at, :meals, :meals_texts, :avatar80x80,
             :orders_by_month_count, :full_free_courier, :pay_methods, :pay_methods_texts

  has_many :categories, serializer: CategorySerializer
  has_many :rooms, serializer: RoomSerializer
  has_many :comments, serializer: CommentSerializer
  has_one :merchant, serializer: MerchantSerializer
  has_many :products, serializer: ProductSerializer
  has_many :coupons, serializer: CouponSerializer

  def products
    object.products.where(:recommend => true)
  end

  def avatar
    object.avatar.url("320xAuto")
  end

  def avatar80x80
    object.avatar.url("80x80")
  end

  def meals_texts

  end

  def pay_methods_texts

  end

  def orders_by_month_count
    object.orders.by_month.count
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

end
