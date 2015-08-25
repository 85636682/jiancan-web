class ShopSerializer < BaseSerializer
  attributes :id, :name, :address, :mobile, :province, :city, :district, :merchant, :avatar, :created_at, :updated_at

  def avatar
    object.avatar.url("80x80")
  end

  def merchant
    MerchantSerializer.new(object.merchant, root: false)
  end

end