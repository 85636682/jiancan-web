module M1
  module Helpers
    def current_merchant
      @current_merchant ||= Merchant.where(private_token: params[:access_token]).first
    end

    def authenticate!
      error!({ error: "验证失败！" }, 401) unless current_merchant
      error!({ error: "账号未通过审核！"}, 401) unless current_merchant.examined
      error!({ error: "登录信息过期！" }, 401) unless current_merchant.check_token_updated
    end

  end
end
