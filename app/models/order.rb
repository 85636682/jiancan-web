class Order < ActiveRecord::Base
  extend Enumerize  #pending 订单新建状态  settled订单结算状态  completed 订单完成支付  canceled订单取消
  enumerize :status,     in: [:paying, :pending, :settled, :confirmed, :express, :completed, :canceled], default: :pending
  enumerize :pay_method, in: [:online, :offline], default: :online

  belongs_to :shop, :counter_cache => true
  belongs_to :room
  belongs_to :user
  belongs_to :worker
  has_many :order_products, :dependent => :destroy
  has_many :products, :through => :order_products
  has_many :notifications, :dependent => :destroy
  belongs_to :coupon_user

  def self.create_sn(shop_id)
    DateTime.parse(Time.now.iso8601).strftime('%Y%m%d%H%M%S') + rand(999).to_s
  end

  def pendings_count
    self.order_products.where("status = 'pending' OR status = 'cooking'").count
  end

  def can_pay?
    status.paying? && pay_method == 'online'
  end

  def total_fee
    total_price + express_charge - decrease_price
  end

  after_create do
    Order.notify_order_created(id)
  end

  def self.notify_order_created(order_id)
    order = Order.find_by_id(order_id)
    return if order.blank?

    Notification.create merchant_id: order.shop.merchant.id, order_id: order.id, read: false
    true
  end

  def settled
    success = false
    if status.pending? && !takeout
      success = update_attributes(:status => 'settled')
    end
    success
  end

  def confirmed
    success = false
    if takeout && status.pending?
      success = update_attributes(:status => 'confirmed')
    end
    success
  end

  def express
    success = false
    if takeout && status.confirmed?
      success = update_attributes(:status => 'express')
    end
    success
  end

  def completed
    success = false
    if status.settled? || status.express?
      success = update_attributes(:status => 'completed')
    end
    success
  end

  def canceled
    success = false
    if status.pending?
      success = update_attributes(:status => 'canceled')
    end
    success
  end

  def push_to_waiter
    begin
      workers = Worker.where(:shop_id => shop.id, :department => "waiter")
      receiver = []
      workers.each do |worker|
        receiver << worker.pusher_id
      end
      if not receiver.empty?
        client = JPush::Client.new(Setting.jpush_app_key_for_waiter, Setting.jpush_master_secret_for_waiter)
        payload = JPush::Push::PushPayload.new(
          platform: 'all',
          audience: JPush::Push::Audience.new.set_alias(receiver),
          notification: JPush::Push::Notification.new.set_alert(
            '有新的外卖订单了，请及时查看！'
          ).set_android(
            alert: '有新的外卖订单了，请及时查看！',
            extras:  { "sn" => sn, "takeout" => takeout }
          ).set_ios(
            alert: '有新的外卖订单了，请及时查看！',
            extras: { "sn" => sn, "takeout" => takeout }
          )
        ).set_message(
          msg_content: "message content test",
          title: "message title test",
          content_type: "message content type test",
          extras: { "sn" => sn, "takeout" => takeout }
        )
        res = client.pusher.push(payload)
      end
    rescue Exception => e
      JcLog.create(content: "#{e.message}#{e.backtrace}", level: "debug")
    end
  end

end
