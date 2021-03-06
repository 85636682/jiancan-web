class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :unread_notify_count
  helper_method :cart_market_product_count

  def require_merchant
    if not merchant_signed_in?
      redirect_to new_merchant_session_path
    end
  end

  def require_admin
    if current_admin.blank?
      redirect_to new_admin_session_path
    end
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin

  def render_404
    render_optional_error_file(404)
  end

  def render_403
    render_optional_error_file(403)
  end

  def render_optional_error_file(status_code)
    status = status_code.to_s
    fname = %w(404 403 422 500).include?(status) ? status : 'unknown'
    render template: "/errors/#{fname}", format: [:html],
           handler: [:erb], status: status, layout: 'application'
  end

  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
    if resource.is_a?(Merchant)
      cpanel_home_index_path
    elsif resource.is_a?(Admin)
      admin_market_products_path
    else
      root_path
    end
  end

  def unread_notify_count
    return 0 if current_merchant.blank?
    @unread_notify_count ||= current_merchant.notifications.unread.count
  end

  def cart_market_product_count
    return 0 if current_merchant.blank?
    @cart_market_product_count ||= current_merchant.market_order_market_products.where(:market_order_id => nil).count
  end

  def is_wechat_brower?
    request.user_agent.index('MicroMessenger/')
  end

  def is_weixin_request?

  end

end
