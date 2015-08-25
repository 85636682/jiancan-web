class ProductSerializer < BaseSerializer
  attributes :id, :name, :shop, :avatar, :created_at, :updated_at

  def avatar
    object.avatar.url("80x80")
  end

  def shop
    ShopSerializer.new(object.shop, root: false)
  end

end