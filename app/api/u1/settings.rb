module U1
  class Settings < Grape::API
    resource :settings do
      desc "APP系统配置参数"
      params do
      end
      get 'config' do
        { msg: 'ok', reg_captcha: false }
      end
    end
  end
end
