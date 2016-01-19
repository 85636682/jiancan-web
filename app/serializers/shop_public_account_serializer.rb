class ShopPublicAccountSerializer < BaseSerializer
  attributes :id, :shop_id, :public_account, :app_id, :app_secret, :is_valid
             :products_menu_url

  def is_valid
    @client ||= WeixinAuthorize::Client.new(self.app_id, self.app_secret)
    @client.is_valid?
  end

  def products_menu_url
    "http://jiancan.me/wechat/products?shop_id=#{self.shop_id}"
  end
end
