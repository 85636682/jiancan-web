module U1
  class Wx < Grape::API
    resource :wx do
      params do
        requires :request_url, type: String, desc: '当前页面'
      end
      get 'sign_package' do
        @wechat_client ||= WeixinAuthorize::Client.new(Rails.application.secrets.wechat_app_id, Rails.application.secrets.wechat_app_secret)
        sign_package = @wechat_client.get_jssign_package(params[:request_url])
        render sign_package
      end
    end
  end
end
