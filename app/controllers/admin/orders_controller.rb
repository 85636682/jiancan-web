class Admin::OrdersController < AdminController
  def index
    @orders = Order.all.order("created_at DESC")
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
