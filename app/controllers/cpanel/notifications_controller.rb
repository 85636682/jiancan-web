class Cpanel::NotificationsController < CpanelController
  def index
    @notifications = current_merchant.notifications.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def read
    @notification = Notification.find(params[:id])
    read = @notification.read ? false : true
    if @notification.update(:read => read)
      redirect_to cpanel_notifications_path, :notice => '更新成功！'
    else
      redirect_to cpanel_notifications_path, :notice => '更新失败！'  
    end
  end

  def read_all
    current_merchant.notifications.where(:read => false).update_all(:read => true)
    redirect_to cpanel_notifications_path, :notice => '已经清空信箱！'
  end

  def clear
    current_merchant.notifications.delete_all
    redirect_to cpanel_notifications_path, :notice => '已经清空信箱！'
  end

  def destroy
    @notification = Notification.find(params[:id])
    if @notification.destroy
      redirect_to cpanel_notifications_path, :notice => '删除成功！'
    else
      redirect_to cpanel_notifications_path, :notice => '删除失败！'  
    end
  end
end
