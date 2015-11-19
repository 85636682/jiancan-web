require 'jpush'

class OrderProduct < ActiveRecord::Base
  extend Enumerize  #pending 新建状态  cooking烹饪状态  finished完成状态  canceled取消
  enumerize :status,     in: [:pending, :cooking, :finished, :canceled], default: :pending

  belongs_to :order
  belongs_to :product

  def self.find_quantity(product_id, order_id)
    where(:product_id => product_id, :order_id => order_id).first.quantity
  end

  def pending?
    status == 'pending'
  end

  def cooking?
    status == 'cooking'
  end

  def finished?
    status == 'finished'
  end

  def canceled?
    status == 'canceled'
  end

  def cooking
    success = false
    success = update_attributes(:status => 'cooking') if status.pending?
    push_to_waiter if success
    success
  end

  def finished
    success = false
    success = update_attributes(:status => 'finished') if status.cooking?
    push_to_waiter if success
    success
  end

  def push_to_waiter
    workers = Worker.where(:shop_id => order.shop.id, :department => "waiter")
    receiver = []
    workers.each do |worker|
      receiver << worker.pusher_id
    end
    master_secret = 'f235d2a9ff190aa676c3a391'
    app_key = '6286de72365249a7dfe95b66'
    client = JPush::JPushClient.new(app_key, master_secret)
    payload = JPush::PushPayload.build(
      platform: JPush::Platform.all,
      notification: JPush::Notification.build(
        alert: '有菜色状态改变了，请及时查看！'),
      message: JPush::Message.build(
        msg_content: "",
        title: "",
        content_type: "",
        extras: { "status" => status, "status_text" => status.text }
      ),
      audience: JPush::Audience.build(
        _alias: receiver))
    res = client.sendPush(payload)
    worker_logfile = File.open("#{Rails.root}/log/jpush.log", 'a')
    worker_logfile.sync = true
    WORKER_LOG = WorkerLogger.new(worker_logfile)
    WORKER_LOG.debug("Got result (" + result.code.to_s + ") " +  result.toJSON)
  end

  def push_to_kitchen(extras)
    workers = Worker.where(:shop_id => order.shop.id, :department => "kitchen")
    receiver = []
    workers.each do |worker|
      receiver << worker.pusher_id
    end
    master_secret = 'f235d2a9ff190aa676c3a391'
    app_key = '6286de72365249a7dfe95b66'
    client = JPush::JPushClient.new(app_key, master_secret)
    payload = JPush::PushPayload.build(
      platform: JPush::Platform.all,
      notification: JPush::Notification.build(
        alert: '有顾客下单新菜色，请及时查看！'),
      message: JPush::Message.build(
        msg_content: "",
        title: "",
        content_type: "",
        extras: extras
      ),
      audience: JPush::Audience.build(
        _alias: receiver))
    res = client.sendPush(payload)
    worker_logfile = File.open("#{Rails.root}/log/jpush.log", 'a')
    worker_logfile.sync = true
    WORKER_LOG = WorkerLogger.new(worker_logfile)
    WORKER_LOG.debug("Got result  (" + result.code.to_s + ")  " +  result.toJSON)
  end

  after_create :update_sales_volume
  def update_sales_volume
    sales_volume = product.sales_volume ||= 0
    product.update(:sales_volume => sales_volume + 1)
  end
end
