class Admin::MarketProductsController < AdminController
  before_action :set_market_product, only: [:show, :edit, :update, :destroy]

  def index
    @market_products = MarketProduct.all
  end

  def show
  end

  def new
    @market_product = MarketProduct.new
  end

  def create
    @market_product = MarketProduct.new(market_product_params)
    if @market_product.save!
      redirect_to admin_market_products_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @market_product.update(market_product_params)
      redirect_to admin_market_products_path, :notice => "保存成功！"
    else
      render :edit, :notice => "保存失败！"
    end
  end

  def destroy
    if @market_product.destroy
      redirect_to admin_market_products_path, :notice => "删除成功！"  
    else
      redirect_to admin_market_products_path, :notice => "删除失败！"  
    end
  end

  private

  def set_market_product
    @market_product = MarketProduct.find(param[:id])
  end

  def market_product_params
    params.require(:market_product).permit(:name, :price, :avatar, :shop_id, :category_id)
  end
end
