class WechatsController < ActionController::Base
  layout 'wechat'
  def products
    @shop = Shop.find(params[:shop_id])
    @categories = @shop.categories
    if params[:category_id].blank?
      @products = @shop.products
    else
      @products = @shop.products.where(category_id: params[:category_id])
    end
  end

  def direct_message_box
    render 'weui/message_box', locals: { title: 'Weui', description: 'directly render in controller' }
  end
end
