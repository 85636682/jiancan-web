class Cpanel::ShopsController < CpanelController
  before_action :set_shop, only: [:show, :edit, :update]

  def index
    @shops = current_merchant.shops
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_merchant.shops.build(shop_params)
    if @shop.save!
      redirect_to cpanel_shops_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to cpanel_shops_path, :notice => "更新成功！"
    else
      render :edit, :notice => "更新失败！"
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :mobile, :avatar, :address, :province, :city, :district)
  end
end
