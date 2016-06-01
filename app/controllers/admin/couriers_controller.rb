class Admin::CouriersController < AdminController

  before_action :set_courier, only: [:show, :edit, :update, :destroy]

  def index
    @couriers = Courier.all
  end

  def show

  end

  def new
    @courier = Courier.new
  end

  def create
    @courier = Courier.new(courier_params)
    if @courier.save
      redirect_to admin_couriers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @courier.update courier_params
      redirect_to :admin_couriers_path
    else
      render :edit
    end
  end

  def destroy
    if @courier.destroy
      redirect_to :admin_couriers_path
    else
      redirect_to :admin_couriers_path
    end
  end

  private
  def set_courier
    @courier = Courier.find(params[:id])
  end

  def courier_params
    params.require(:courier).permit(:name, :login, :mobile, :password, :password_confirmation)
  end
end
