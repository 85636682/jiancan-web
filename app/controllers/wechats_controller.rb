class WechatsController < ApplicationController
  layout 'wechat'

  wechat_responder

  before_action :create_wechat_client, only: [:activity]
  before_action :invoke_wx_auth, only: [:activity]
  before_action :get_wechat_sns, only: [:activity], if: :is_wechat_brower?

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
    @user = User.find_by_weixin_open_id(session[:openid]) if @user.blank?
  end

  private
  def create_wechat_client
    @wechat_client ||= WeixinAuthorize::Client.new(Rails.application.secrets.wechat_app_id, Rails.application.secrets.wechat_app_secret)
  end
   # 调用微信授权获取openid
  def invoke_wx_auth
    if params[:state].present? || session['openid'].present? #|| !is_wechat_brower?
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

  # default text responder when no other match
  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end

  # When receive 'help', will trigger this responder
  on :text, with: 'help' do |request|
    request.reply.text 'help content'
  end

  # When receive '<n>news', will match and will got count as <n> as parameter
  on :text, with: /^(\d+) news$/ do |request, count|
    # Wechat article can only contain max 10 items, large than 10 will dropped.
    news = (1..count.to_i).each_with_object([]) { |n, memo| memo << { title: 'News title', content: "No. #{n} news content" } }
    request.reply.news(news) do |article, n, index| # article is return object
      article.item title: "#{index} #{n[:title]}", description: n[:content], pic_url: 'http://www.baidu.com/img/bdlogo.gif', url: 'http://www.baidu.com/'
    end
  end

  on :event, with: 'subscribe' do |request|
    request.reply.text "#{request[:FromUserName]} subscribe now"
  end

  # When unsubscribe user scan qrcode qrscene_xxxxxx to subscribe in public account
  # notice user will subscribe public account at same time, so wechat won't trigger subscribe event any more
  on :scan, with: 'qrscene_xxxxxx' do |request, ticket|
    request.reply.text "Unsubscribe user #{request[:FromUserName]} Ticket #{ticket}"
  end

  # When subscribe user scan scene_id in public account
  on :scan, with: 'scene_id' do |request, ticket|
    request.reply.text "Subscribe user #{request[:FromUserName]} Ticket #{ticket}"
  end

  # When no any on :scan responder can match subscribe user scaned scene_id
  on :event, with: 'scan' do |request|
    if request[:EventKey].present?
      request.reply.text "event scan got EventKey #{request[:EventKey]} Ticket #{request[:Ticket]}"
    end
  end

  # When enterprise user press menu BINDING_QR_CODE and success to scan bar code
  on :scan, with: 'BINDING_QR_CODE' do |request, scan_result, scan_type|
    request.reply.text "User #{request[:FromUserName]} ScanResult #{scan_result} ScanType #{scan_type}"
  end

  # Except QR code, wechat can also scan CODE_39 bar code in enterprise account
  on :scan, with: 'BINDING_BARCODE' do |message, scan_result|
    if scan_result.start_with? 'CODE_39,'
      message.reply.text "User: #{message[:FromUserName]} scan barcode, result is #{scan_result.split(',')[1]}"
    end
  end

  # When user click the menu button
  on :click, with: 'BOOK_LUNCH' do |request, key|
    request.reply.text "User: #{request[:FromUserName]} click #{key}"
  end

  # When user view URL in the menu button
  on :view, with: 'http://wechat.somewhere.com/view_url' do |request, view|
    request.reply.text "#{request[:FromUserName]} view #{view}"
  end

  # When user sent the imsage
  on :image do |request|
    request.reply.image(request[:MediaId]) # Echo the sent image to user
  end

  # When user sent the voice
  on :voice do |request|
    request.reply.voice(request[:MediaId]) # Echo the sent voice to user
  end

  # When user sent the video
  on :video do |request|
    nickname = wechat.user(request[:FromUserName])['nickname'] # Call wechat api to get sender nickname
    request.reply.video(request[:MediaId], title: 'Echo', description: "Got #{nickname} sent video") # Echo the sent video to user
  end

  # When user sent location
  on :location do |request|
    request.reply.text("Latitude: #{message[:Latitude]} Longitude: #{message[:Longitude]} Precision: #{message[:Precision]}")
  end

  on :event, with: 'unsubscribe' do |request|
    request.reply.success # user can not receive this message
  end

  # When user enter the app / agent app
  on :event, with: 'enter_agent' do |request|
    request.reply.text "#{request[:FromUserName]} enter agent app now"
  end

  # When batch job create/update user (incremental) finished.
  on :batch_job, with: 'sync_user' do |request, batch_job|
    request.reply.text "sync_user job #{batch_job[:JobId]} finished, return code #{batch_job[:ErrCode]}, return message #{batch_job[:ErrMsg]}"
  end

  # When batch job replace user (full sync) finished.
  on :batch_job, with: 'replace_user' do |request, batch_job|
    request.reply.text "replace_user job #{batch_job[:JobId]} finished, return code #{batch_job[:ErrCode]}, return message #{batch_job[:ErrMsg]}"
  end

  # When batch job invent user finished.
  on :batch_job, with: 'invite_user' do |request, batch_job|
    request.reply.text "invite_user job #{batch_job[:JobId]} finished, return code #{batch_job[:ErrCode]}, return message #{batch_job[:ErrMsg]}"
  end

  # When batch job replace department (full sync) finished.
  on :batch_job, with: 'replace_party' do |request, batch_job|
    request.reply.text "replace_party job #{batch_job[:JobId]} finished, return code #{batch_job[:ErrCode]}, return message #{batch_job[:ErrMsg]}"
  end

  # Any not match above will fail to below
  on :fallback, respond: 'fallback message'
end
