module V1
  module Helpers
    def current_worker
      @current_worker ||= Worker.where(private_token: params[:access_token]).first
    end

    def authenticate!
      error!({ error: "验证失败！" }, 401) unless current_worker
      error!({ error: "登录信息过期" }, 401) unless current_worker.check_token_updated
    end

    def waiter!
      error!({ error: "权限不足" }, 403) unless current_worker.department.waiter?
    end

    def kitchen!
      error!({ error: "权限不足" }, 403) unless current_worker.department.kitchen?
    end

    def counter!
      error!({ error: "权限不足" }, 403) unless current_worker.department.counter?
    end

    def waiter_or_counter!
      error!({ error: "权限不足" }, 403) unless current_worker.department.waiter? || current_worker.department.counter?
    end

    def kitchen_or_counter!
      error!({ error: "权限不足" }, 403) unless current_worker.department.kitchen? || current_worker.department.counter?
    end
  end
end
