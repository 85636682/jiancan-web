module M1
  class Weixins < Grape::API
    resource :weixins do
      desc "获取公众账号信息"
      params do
      end
      get "", serializer: ShopPublicAccountSerializer, root: false do
        authenticate!
        @shop_public_account = ShopPublicAccount.find_or_create_by(shop_id: current_merchant.shop.id)
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
      put "binding", serializer: ShopPublicAccountSerializer, root: false do
        authenticate!
        @shop_public_account = ShopPublicAccount.find_or_create_by(shop_id: current_merchant.shop.id)
        if @shop_public_account.update_attributes(params[:shop_public_account])
          render @shop_public_account
        else
          error!({ error: "绑定失败！" }, 400)
        end
      end

      desc "获取自定义父级菜单"
      params do
      end
      get "diymenus/parent", each_serializer: DiymenuSerializer, root: false do
        authenticate!
        render current_merchant.shop.shop_public_account.parent_menus
      end

      desc "获取自定义子级菜单"
      params do
        requires :diymenu_id, type: Integer, desc: "菜单id"
      end
      get "diymenus/sub", each_serializer: DiymenuSerializer, root: false do
        authenticate!
        @parent_menu = Diymenu.find_by_id(params[:diymenu_id])
        error!({ error: "菜单不存在！" }, 400) if @parent_menu.blank?
        @parent_menu.sub_menus
      end

      desc "创建自定义菜单"
      params do
        requires :diymenu, type: Hash do
          optional :parent_id, type: Integer, desc: "所属父级菜单，如果当前是父级菜单，则此值为空"
          requires :name, type: String, desc: "菜单名称"
          requires :key, type: String, desc: "click or view"
          requires :url, type: String, desc: "点击菜单要跳转的url"
          requires :is_show, type: Boolean, desc: "是否显示"
          requires :sort, type: Integer, desc: "排序，数值越少，显示越前"
        end
      end
      post "diymenus", serializer: DiymenuSerializer, root: false do
        authenticate!
        @diymenu = Diymenu.new(params[:diymenu])
        @diymenu.shop_public_account_id = current_merchant.shop.shop_public_account.id
        if @diymenu.save
          render @diymenu
        else
          error!({ error: "菜单创建失败！" }, 400)
        end
      end

      desc "同步到公众账号"
      params do
      end
      get "update" do
        weixin_client = WeixinAuthorize::Client.new(current_merchant.shop.shop_public_account.app_key, current_merchant.shop.shop_public_account.app_secret)
        menu = current_merchant.shop.shop_public_account.build_menu
        result = weixin_client.create_menu(menu)
        error!({ error: result["errmsg"] }, 400) if result["errcode"] != 0
        { msg: "同步成功！" }
      end

    end
  end
end
