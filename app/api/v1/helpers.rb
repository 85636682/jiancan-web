module V1
  module Helpers
    def current_merchant
      @current_merchant ||= Merchant.where(private_token: params[:token]).first
    end

    def authenticate!
      error!('401 Unauthenticated', 401) unless current_merchant
    end
  end
end