class RoomSerializer < BaseSerializer
  attributes :id, :name, :seat, :shop_id

  has_one :shop, serializer: ShopSerializer
end
