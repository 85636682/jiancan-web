class WelcomeController < ApplicationController
  layout false

  def index

  end

  def apply

  end

  def applied
    if params[:merchant].blank? || params[:shop].blank?
      redirect_to welcome_apply_path, :alert => "资料提交失败！请正确填写下面资料！}"
    end
    merchant = Merchant.new(:mobile => params[:merchant]["mobile"],
                            :password => params[:merchant]["password"],
                            :password_confirmation => params[:merchant]["password_confirmation"])
    if not merchant.save
      redirect_to welcome_apply_path, :alert => "资料提交失败！原因：#{merchant.errors.full_messages.join(', ')}"
    end
    shop = Shop.new(:name => params[:shop][:name],
                    :merchant_id => merchant.id,
                    :mobile => params[:shop][:mobile])
    if not shop.save
      redirect_to welcome_apply_path, :alert => "资料提交失败！原因：#{shop.errors.full_messages.join(', ')}"
    end
  end

  def api
    @routes = []
    Api::Dispatch.routes.each do |route|
      next if route.route_method.blank?
      path = route.route_path
      path.sub!('(.:format)', '.json')
      path.sub!('/:version', '')

      r = {
        id: path.dasherize,
        method: route.route_method,
        name: path,
        params: route.route_params,
        desc: route.route_description
      }
      @routes << r
    end
    @routes.sort_by! { |a| a[:name] }
  end

  def error_404
    render_404
  end

end
