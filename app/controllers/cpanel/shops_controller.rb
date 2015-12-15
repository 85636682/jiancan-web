require "addressable/uri"

class Cpanel::ShopsController < CpanelController
  before_action :set_shop, only: [:show, :edit, :update]

  def index
    @shop = current_merchant.shop
  end

  def show
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.merchant_id = current_merchant.id
    if @shop.save!
      redirect_to cpanel_shops_path, :notice => "保存成功！"
    else
      render :new, :alert => "保存失败！"
    end
  end

  def edit
  end

  def update
    response = RestClient.get Addressable::URI.parse("http://api.map.baidu.com/geocoder/v2/" +
                              "?ak=#{Setting.baidu_map_ak}" +
                              "&output=json" +
                              "&address=#{@shop.address}" +
                              "&city=#{ChinaCity.get(@shop.city)}").normalize.to_str
    result = JSON.parse(response.force_encoding("UTF-8").gsub(/[\u0011-\u001F]/, ""))
    if result["status"] == 0
      params[:shop][:lat] = result["result"]["location"]["lat"]
      params[:shop][:lng] = result["result"]["location"]["lng"]
    end
    if @shop.update(shop_params)
      redirect_to cpanel_shops_path, :notice => "更新成功！"
    else
      render :edit, :alert => "更新失败！"
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
