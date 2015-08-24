class Cpanel::RoomsController < CpanelController
  before_action :set_shop, only: [:new, :edit]
  before_action :set_room, only: [:show, :edit, :update]

  def index
    @rooms = current_merchant.shops.first.rooms
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save!
      redirect_to cpanel_rooms_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to cpanel_rooms_path, :notice => "保存成功！"
    else
      render :new, :notice => "保存失败！"
    end
  end

  def destroy
  end

  private

  def set_shop
    @shop = current_merchant.shops.first
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :seat, :shop_id)
  end
end
