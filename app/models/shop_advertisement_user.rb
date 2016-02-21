class ShopAdvertisementUser < ActiveRecord::Base
  belongs_to :shop_advertisement
  belongs_to :user
end
