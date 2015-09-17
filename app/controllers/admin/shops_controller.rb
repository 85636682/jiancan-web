class Admin::ShopsController < AdminController
  before_action :set_shop, only: [:show, :edit, :update]

  def index
    @shops = Shop.all
  end

  def show
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to admin_shops_path, :notice => "更新成功！"
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
