require 'jpush'

class OrderProduct < ActiveRecord::Base
  extend Enumerize  #pending 新建状态  cooking烹饪状态  finished完成状态  canceled取消
  enumerize :status,     in: [:pending, :cooking, :finished, :canceled], default: :pending

  belongs_to :order
  belongs_to :product

  def self.find_quantity(product_id, order_id)
    where(:product_id => product_id, :order_id => order_id).first.quantity
  end

  def status_text
    status.text
  end

  def pending?
    status == 'pending'
  end

  def cooking?
    status == 'cooking'
  end

  def cooking
    success = false
    if status.pending?
      success = update_attributes(:status => 'cooking')
    end
    if success
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
          alert: '有菜色正在烹饪，请及时查看！'),
        message: JPush::Message.build(
          msg_content: "",
          title: "",
          content_type: "",
          extras: { "status" => "cooking", "status_text" => "烹饪" }
        ),
        audience: JPush::Audience.build(
          _alias: receiver))
      res = client.sendPush(payload)
      logger.debug("Got result  " +  res.toJSON)
    end
    success
  end

  def finished?
    status == 'finished'
  end

  def finished
    success = false
    if status.cooking?
      success = update_attributes(:status => 'finished')
    end
    if success
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
          alert: '有菜色已经完成，请及时查看！'),
        message: JPush::Message.build(
          msg_content: "",
          title: "",
          content_type: "",
          extras:  { "status" => "finished", "status_text" => "完成" }
        ),
        audience: JPush::Audience.build(
          _alias: receiver))
      res = client.sendPush(payload)
      logger.debug("Got result  " +  res.toJSON)
    end
    success
  end

  def canceled?
    status == 'canceled'
  end

  after_create :update_sales_volume, :push_to_kitchen

  def update_sales_volume
    sales_volume = product.sales_volume ||= 0
    product.update(:sales_volume => sales_volume + 1)
  end

  def push_to_kitchen
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
        extras: self.as_json(include: { product: { methods: :avatar } }, methods: :status_text)
      ),
      audience: JPush::Audience.build(
        _alias: receiver))
    res = client.sendPush(payload)
    logger.debug("Got result  " +  res.toJSON)
  end
end
