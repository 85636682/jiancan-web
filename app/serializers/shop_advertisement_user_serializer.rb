class ShopAdvertisementUserSerializer < BaseSerializer
  attributes :id, :shop_advertisement_id, :user_id, :forwarding_times, :created_at, :updated_at

  has_one :user
end
