class Cpanel::RoomsController < CpanelController
  before_action :set_shop, only: [:new, :edit, :create]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = current_merchant.shop.rooms.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to cpanel_rooms_path, :notice => "保存成功！"
    else
      render :new, :alert => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to cpanel_rooms_path, :notice => "保存成功！"
    else
      render :edit, :alert => "保存失败！"
    end
  end

  def destroy
    if @room.destroy
      redirect_to cpanel_rooms_path, :notice => "删除成功！"
    else
      redirect_to cpanel_rooms_path, :notice => "删除失败！"
    end
  end

  private

  def set_shop
    @shop = current_merchant.shop
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :seat, :shop_id)
  end
end
