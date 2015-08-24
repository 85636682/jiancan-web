class ProductSerializer < BaseSerializer
  attributes :id, :name, :shop, :avatar, :created_at, :updated_at

  def shop
    ShopSerializer.new(object.shop, root: false)
  end

end