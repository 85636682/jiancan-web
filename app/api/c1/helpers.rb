module C1
  module Helpers
    def current_courier
      @current_courier ||= Courier.where(private_token: params[:access_token]).first
    end

    def authenticate!
      error!({ error: "验证失败！" }, 401) unless current_courier
      error!({ error: "登录信息过期！" }, 401) unless current_courier.check_token_updated
    end

  end
end
