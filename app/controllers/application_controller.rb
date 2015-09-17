class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def require_merchant
    if not merchant_signed_in?
      redirect_to new_merchant_session_path
    end
  end

  def require_admin
    if not admin_signed_in?
      redirect_to new_admin_session_path
    end
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
end
