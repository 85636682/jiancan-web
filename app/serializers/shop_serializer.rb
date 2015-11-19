class ShopSerializer < BaseSerializer
  attributes :id, :name, :address, :mobile, :province, :city, :district, :merchant, :avatar, :created_at, :updated_at, :categories

  has_many :categories, serializer: CategorySerializer
  has_one :merchant, serializer: MerchantSerializer

  def avatar
    object.avatar.url("80x80")
  end
end
