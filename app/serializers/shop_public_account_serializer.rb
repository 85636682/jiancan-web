class ShopPublicAccountSerializer < BaseSerializer
  attributes :id, :shop_id, :public_account, :app_id, :app_secret, :is_valid

  def is_valid
    @client ||= WeixinAuthorize::Client.new(self.app_id, self.app_secret)
    @client.is_valid?
  end
end
