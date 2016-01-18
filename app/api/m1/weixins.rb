module M1
  class Weixins < Grape::API
    resource :weixins do
      desc "获取公众账号信息"
      params do
      end
      get "", serializer: ShopSerializer, root: false do
        authenticate!
        @shop_public_account = ShopPublicAccount.find_or_create_by_shop_id(current_merchant.shop.id)
        render @shop_public_account
      end

      desc "绑定微信公众账号"
      params do
        requires :shop_public_account, type: Hash do
          requires :public_account, type: String, desc: "公众账号"
          requires :app_id, type: String, desc: "公众账号的app_id"
          requires :app_secret, type: String, desc: "公众账号的app_secret"
        end
      end
      put "binding", serializer: ShopSerializer, root: false do
        authenticate!
        @shop_public_account = ShopPublicAccount.find_or_create_by_shop_id(current_merchant.shop.id)
        if @shop_public_account.update_attributes(params[:shop_public_account])
          render @shop_public_account
        else
          error!({ error: "绑定失败！" }, 400)
        end
      end
    end
  end
end
