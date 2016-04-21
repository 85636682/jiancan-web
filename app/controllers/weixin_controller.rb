class WeixinsController < ApplicationController
  layout 'wechat'

  before_action :create_wechat_client
  before_action :invoke_wx_auth, only: [:activity, :advertisement, :authorize]
  before_action :get_wechat_sns, only: [:activity, :advertisement, :authorize], if: :is_wechat_brower?

  def products
    @shop = Shop.find(params[:shop_id])
    @categories = @shop.categories
    if params[:category_id].blank?
      @products = @shop.products
    else
      @products = @shop.products.where(category_id: params[:category_id])
    end
  end

  def product
    @product = Product.find(params[:product_id])
  end

  def activity
    @activity = Activity.find_by_id(params[:activity_id])
    @target_user = User.find_by_id(params[:target_user_id])
    if @target_user.present?
      @activity_target_user = ActivityUser.where(activity_id: @activity.id, user_id: @target_user.id).first
    end
    @activity_user = ActivityUser.create_with(likes: 0).find_or_create_by(activity_id: @activity.id, user_id: @user.id)
    @share_title = @activity.title
    @share_link = "http://jiancan.me/wechat/activity?activity_id=#{@activity.id}&target_user_id=#{@user.id}"
  end

  def advertisement
    @advertisement = ShopAdvertisement.find_by_id(params[:advertisement_id])
    @shop_advertisement_user = ShopAdvertisementUser.create_with(forwarding_times: 0).find_or_create_by(shop_advertisement_id: @advertisement.id, user_id: @user.id)
    @share_title = @advertisement.title
    @share_link = "http://jiancan.me/wechat/advertisement?advertisement_id=#{@advertisement.id}"
  end

  def authorize
    if params[:request_url] == 'check'
      shop = Shop.find(params[:shop_id])
      url = "http://jiancan.me/wx.html#!/authorize?request_url=#{params[:request_url]}&shop_id=#{params[:shop_id]}&express=#{shop.full_free_courier}&access_token=#{@user.private_token}"
    else
      url = "http://jiancan.me/wx.html#!/authorize?request_url=#{params[:request_url]}&access_token=#{@user.private_token}"
    end
    redirect_to url
  end

  private
  def create_wechat_client
    @wechat_client ||= WeixinAuthorize::Client.new(Rails.application.secrets.wechat_app_id, Rails.application.secrets.wechat_app_secret)
  end
   # 调用微信授权获取openid
  def invoke_wx_auth
    if params[:state].present? || session['openid'].present? #|| !is_wechat_brower?
      if @user.blank?
        @user = User.find_by_weixin_open_id(session[:openid])
        @user.update_private_token
      end
      return # 防止进入死循环授权
    end
    sns_url =  @wechat_client.authorize_url(request.url, scope="snsapi_userinfo")
    redirect_to sns_url and return
  end

  # 在invoke_wx_auth中做了跳转之后，此方法截取
  def get_wechat_sns
    # params[:state] 这个参数是微信特定参数，所以可以以此来判断授权成功后微信回调。
    if session[:openid].blank? && params[:state].present?
      sns_info = @wechat_client.get_oauth_access_token(params[:code])
      # 如果网页授权作用域为snsapi_userinfo，则此时开发者可以通过access_token和openid拉取用户信息了。
      user_info = @wechat_client.get_oauth_userinfo(sns_info.result["openid"], sns_info.result["access_token"])
      #Rails.logger.error("Weixin oauth2 response: #{user_info.result}")
      @user = User.from_omniauth(user_info.result)
      # 重复使用相同一个code调用时：
      if sns_info.result["errcode"] != "40029"
        session[:openid] = sns_info.result["openid"]
      end
    end
  end

end
