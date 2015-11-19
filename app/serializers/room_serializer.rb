class RoomSerializer < BaseSerializer
  attributes :id, :name, :shop

  has_one :shop, serializer: ShopSerializer
end
