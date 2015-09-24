class Cpanel::WorkersController < CpanelController
  before_action :set_shop, only: [:new, :edit]
  before_action :set_worker, only: [:edit, :destroy]

  def index
    @workers = current_merchant.shop.workers.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save!
      redirect_to cpanel_workers_path, :notice => "保存成功！"
    else
      render :new, :alert => "保存失败！"
    end
  end

  def edit
  end

  def update
    if @worker.update(worker_params)
      redirect_to cpanel_workers_path, :notice => "保存成功！"
    else
      render :edit, :alert => "保存失败！"
    end
  end

  def destroy
    if @worker.destroy
      redirect_to cpanel_workers_path, :notice => "删除成功！"
    else
      redirect_to cpanel_workers_path, :alert => "删除失败！"
    end
  end

  private

  def set_shop
    @shop = current_merchant.shop
  end

  def set_worker
    
  end

  def worker_params
    params.require(:worker).permit(:name, :imei, :shop_id)
  end
end
