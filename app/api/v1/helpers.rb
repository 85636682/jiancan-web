module V1
  module Helpers
    def current_worker
      @current_worker ||= Worker.where(private_token: params[:access_token]).first
    end

    def authenticate!
      error!('401 Unauthenticated', 401) unless current_worker
    end

    def waiter!
      error!('401 No Waiter', 401) unless current_worker.waiter?
    end

    def kitchen!
      error!('401 No Kitchen', 401) unless current_worker.kitchen?
    end
  end
end
