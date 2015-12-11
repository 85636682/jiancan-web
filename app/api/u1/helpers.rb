module U1
  module Helpers
    def current_user
      @current_user ||= User.where(private_token: params[:access_token]).first
    end

    def authenticate!
      error!({ error: "验证失败！" }, 401) unless current_user
      error!({ error: "登录信息过期" }, 401) unless current_user.check_token_updated
    end

  end
end
