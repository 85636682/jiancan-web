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

  def product
    @product = Product.find(params[:product_id])
  end

  def activity
    @activity = Activity.find_by_id(params[:activity_id])
  end
end
