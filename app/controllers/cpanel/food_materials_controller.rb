class Cpanel::FoodMaterialsController < CpanelController
  before_action :set_food_material, only: [:show, :edit, :update, :destroy]
  before_action :set_shop, only: [:new, :edit]

  def index
    @food_materials = current_merchant.shop.food_materials.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @food_material = FoodMaterial.new
  end

  def create
    @food_material = FoodMaterial.new(food_material_params)
    if @food_material.save
      redirect_to cpanel_food_material_path(@food_material), :notice => "保存成功！"
    else
      render :new, :alert => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @food_material.update(food_material_params)
      redirect_to cpanel_food_material_path(@food_material), :notice => "保存成功！"
    else
      render :edit, :alert => "保存失败！"
    end
  end

  def destroy
    if @food_material.destroy
      redirect_to cpanel_food_materials_path, :notice => "删除成功！"
    else
      redirect_to cpanel_food_materials_path, :alert => "删除失败！"
    end
  end

  private

  def set_food_material
    @food_material = FoodMaterial.find(params[:id])
  end

  def set_shop
    @shop = current_merchant.shop
  end

  def food_material_params
    params.require(:food_material).permit(:name, :shop_id, :avatar, :stock_balance, :minimum_stock, :maximum_stock)
  end
end
