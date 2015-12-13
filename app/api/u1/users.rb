if defined? Yajl
  require 'yajl/json_gem'
else
  require "json"
end

module U1
  class Users < Grape::API
    resource :users do
      desc "用户登录"
      params do
        requires :mobile, type: String, desc: "用户账号"
        requires :password,  type: String, desc: "用户密码"
      end
      post 'login' do
        user = User.find_by_mobile(params[:mobile])
        if user && user.authenticate(params[:password])
          { msg: "登录成功！", access_token: user.get_private_token, pusher_id: user.pusher_id }
        else
          error!({ error: "用户和密码不正确！" }, 401)
        end
      end

      desc "用户注册"
      params do
        requires :mobile, type: String, desc: "用户账号"
        requires :password, type: String, desc: "用户密码"
        requires :password_confirmation, type: String, desc: "用户密码"
      end
      post 'register' do
        user = User.find_by_mobile(params[:mobile])
        if user.blank?
          error!({ error: "用户名已存在！" }, 401)
        else
          user = User.new(:mobile => params["mobile"],
                          :password => params["password"],
                          :password_confirmation => params["password_confirmation"])
          if user.save
            { msg: "注册成功！", access_token: user.get_private_token, pusher_id: user.pusher_id }
          else
            error!({ error: "用户注册失败！" }, 401)
          end
        end
      end

      desc "微信登录，通过code获取access_token"
      params do
        requires :code, type: String, desc: "微信用户授权后返回的code"
      end
      get 'weixin/access_token' do
        error!({ error: "code不能为空！"}, 401) if params[:code].blank?
        response = RestClient.get "https://api.weixin.qq.com/sns/oauth2/access_token?" +
                                  "appid=#{Setting.weixin_app_id}" +
                                  "&secret=#{Setting.weixin_app_secret}" +
                                  "&code=#{params[:code]}" +
                                  "&grant_type=authorization_code"
        result = JSON.parse(response.force_encoding("UTF-8").gsub(/[\u0011-\u001F]/, ""))
        if !result["errcode"].blank? && result["errcode"] == 41002
          error!({ error: result["errmsg"]}, 401)
        else
          error!({ error: "微信返回数据有误！"}, 401) if result["access_token"].blank? || result["refresh_token"].blank? || result["openid"].blank?

          user = User.where(:weixin_open_id => result["openid"]).first
          if user.blank?
            userinfo_respone = RestClient.get "https://api.weixin.qq.com/sns/userinfo?" +
                                      "access_token=#{result["access_token"]}&" +
                                      "openid=#{result["openid"]}"
            userinfo = JSON.parse(response.force_encoding("UTF-8").gsub(/[\u0011-\u001F]/, ""))
            error!({ error: userinfo["errmsg"]}, 401) if !userinfo["errcode"].blank? && userinfo["errcode"] == 40003
            user = User.create(:weixin_open_id => result["openid"],
                               :weixin_access_token => result["access_token"],
                               :weixin_refresh_token => result["refresh_token"],
                               :nickname => "#{userinfo["nickname"]}#{[*('a'..'z'),*('A'..'Z'),*(0..9)].shuffle[0..3].join}")
          else
            user.update_attributes(:weixin_access_token => result["access_token"],
                                   :weixin_refresh_token => result["refresh_token"])
          end
          { msg: "登录成功！", nickname: user.nickname, access_token: user.get_private_token, pusher_id: user.pusher_id }
        end
      end

      desc "微信登录，refresh Token获取新access_token"
      params do

      end
      get 'weixin/access_token/refresh' do
        response = RestClient.get "https://api.weixin.qq.com/sns/oauth2/refresh_token?" +
                                  "appid=APPID&" +
                                  "grant_type=refresh_token&" +
                                  "refresh_token=#{REFRESH_TOKEN}"
        result = JSON.parse(response.force_encoding("UTF-8").gsub(/[\u0011-\u001F]/, ""))
        if !result["errcode"].blank? && result["errcode"] == 40030
          error!({ error: result["errmsg"]}, 401)
        else
          user = User.where(:weixin_open_id => result["openid"]).first
          error!({ error: "用户不存在！"}, 401) if user.blank?
          user.update_attributes(:weixin_access_token => result["access_token"],
                                 :weixin_refresh_token => result["refresh_token"])
        end
        { msg:'ok' }
      end

    end
  end
end
