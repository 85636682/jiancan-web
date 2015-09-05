class RoomSerializer < BaseSerializer
  attributes :id, :name, :shop

  def shop
    ShopSerializer.new(object.shop, root: false)
  end
end