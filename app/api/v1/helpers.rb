module V1
  module Helpers
    def current_worker
      @current_worker ||= Worker.where(private_token: params[:token]).first
    end

    def authenticate!
      error!('401 Unauthenticated', 401) unless current_worker
    end
  end
end