class Cpanel::CategoriesController < CpanelController
  before_action :set_shop, only: [:new, :edit]
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = current_merchant.shop.categories.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save!
      redirect_to cpanel_categories_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to cpanel_categories_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def destroy
  end

  private

  def set_shop
    @shop = current_merchant.shop
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :shop_id)
  end
end
