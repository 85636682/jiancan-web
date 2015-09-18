class Admin::MarketCategoriesController < AdminController
  before_action :set_market_category, only: [:show, :edit, :update]

  def index
    @market_categories = MarketCategory.all
  end

  def show
  end

  def new
    @market_category = MarketCategory.new
  end

  def create
    @market_category = MarketCategory.new(market_category_params)
    if @market_category.save!
      redirect_to cpanel_market_categories_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @market_category.update(market_category_params)
      redirect_to cpanel_market_categories_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def destroy
  end

  private

  def set_market_category
    @market_category = MarketCategory.find(params[:id])
  end

  def market_category_params
    params.require(:market_category).permit(:name)
  end
end
