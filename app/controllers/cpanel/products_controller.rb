class Cpanel::ProductsController < CpanelController
  before_action :set_shop, only: [:new, :edit]
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = current_merchant.shop.products
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to cpanel_products_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to cpanel_products_path, :notice => "保存成功！"
    else
      render :edit, :notice => "保存失败！"
    end
  end

  def destroy
  end

  private

  def set_shop
    @shop = current_merchant.shop
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :avatar, :shop_id, :category_id)
  end
end
