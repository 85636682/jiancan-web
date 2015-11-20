class Admin::JcLogsController < AdminController
  def index
    @jc_logs = JcLog.all
  end

  def destroy
  end
end
