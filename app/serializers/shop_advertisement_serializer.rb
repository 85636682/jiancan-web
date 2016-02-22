class ShopAdvertisementSerializer < BaseSerializer
  attributes :id, :title, :content, :divide_into, :avatar

  has_many :shop_advertisement_users

  def avatar
    object.avatar.url("80x80")
  end
end
