class ShopAdvertisementSerializer < BaseSerializer
  attributes :id, :title, :content, :divide_into

  has_many :shop_advertisement_users
end
