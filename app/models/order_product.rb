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

  def push_to_waiter
    begin
      workers = Worker.where(:shop_id => order.shop.id, :department => "waiter")
      receiver = []
      workers.each do |worker|
        receiver << worker.pusher_id
      end
      if not receiver.empty?
        client = JPush::JPushClient.new(Setting.jpush_app_key_for_waiter, Setting.jpush_master_secret_for_waiter)
        payload = JPush::PushPayload.build(
          platform: JPush::Platform.all,
          notification: JPush::Notification.build(
            alert: '有菜色状态改变了，请及时查看！',
            android: JPush::AndroidNotification.build(
              alert: '有菜色状态改变了，请及时查看！',
              extras:  { "status" => status, "status_text" => status.text, "sn" => order.sn }
            ),
            ios: JPush::IOSNotification.build(
              alert: '有菜色状态改变了，请及时查看！',
              extras:  { "status" => status, "status_text" => status.text, "sn" => order.sn }
            )
          ),
          message: JPush::Message.build(
            msg_content: "message content test",
            title: "message title test",
            content_type: "message content type test",
            extras: { "status" => status, "status_text" => status.text, "sn" => order.sn }
          ),
          audience: JPush::Audience.build(_alias: receiver)
        )
        res = client.sendPush(payload)
      end
    rescue JPush::ApiConnectionException
      JcLog.create(content: "JPush::ApiConnectionException", level: "debug")
    end
  end

  def push_to_kitchen(extras)
    begin
      workers = Worker.where(:shop_id => order.shop.id, :department => "kitchen")
      receiver = []
      workers.each do |worker|
        receiver << worker.pusher_id
      end
      if not receiver.empty?
        client = JPush::JPushClient.new(Setting.jpush_app_key_for_kitchen, Setting.jpush_master_secret_for_kitchen)
        payload = JPush::PushPayload.build(
          platform: JPush::Platform.all,
          notification: JPush::Notification.build(alert: '有顾客下单新菜色，请及时查看！'),
          message: JPush::Message.build(
            msg_content: "message content test",
            title: "message title test",
            content_type: "message content type test",
            extras: extras
          ),
          audience: JPush::Audience.build(_alias: receiver)
        )
        res = client.sendPush(payload)
      end
    rescue JPush::ApiConnectionException
      JcLog.create(content: "JPush::ApiConnectionException", level: "debug")
    end
  end

  def push_to_counter(extras)
    begin
      workers = Worker.where(:shop_id => order.shop.id, :department => "counter")
      receiver = []
      workers.each do |worker|
        receiver << worker.pusher_id
      end
      if not receiver.empty?
        client = JPush::JPushClient.new(Setting.jpush_app_key_for_kitchen, Setting.jpush_master_secret_for_kitchen)
        payload = JPush::PushPayload.build(
          platform: JPush::Platform.all,
          notification: JPush::Notification.build(alert: '有顾客下单新菜色，请及时查看！'),
          message: JPush::Message.build(
            msg_content: "message content test",
            title: "message title test",
            content_type: "message content type test",
            extras: extras
          ),
          audience: JPush::Audience.build(_alias: receiver)
        )
        res = client.sendPush(payload)
      end
    rescue JPush::ApiConnectionException
      JcLog.create(content: "JPush::ApiConnectionException", level: "debug")
    end
  end

  after_create :update_sales_volume
  def update_sales_volume
    sales_volume = product.sales_volume ||= 0
    product.update(:sales_volume => sales_volume + 1)
  end
end
