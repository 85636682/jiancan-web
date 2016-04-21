class Order < ActiveRecord::Base
  extend Enumerize  #pending 订单新建状态  settled订单结算状态  completed 订单完成支付  canceled订单取消
  enumerize :status,     in: [:pending, :settled, :payed, :confirmed, :express, :completed, :canceled], default: :pending
  enumerize :pay_method, in: [:online, :offline], default: :online

  belongs_to :shop
  belongs_to :room
  belongs_to :user
  belongs_to :worker
  has_many :order_products
  has_many :products, :through => :order_products, :dependent => :destroy
  has_many :notifications, :dependent => :destroy

  def self.create_sn(shop_id)
    DateTime.parse(Time.now.iso8601).strftime('%Y%m%d%H%M%S') + rand(999).to_s
  end

  def pendings_count
    self.order_products.where("status = 'pending' OR status = 'cooking'").count
  end

  def total_fee
    total_price + express_charge
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

  def payed
    success = false
    if status.pending? && takeout && pay_method == 'online'
      success = update_attributes(:status => 'payed')
    end
    success
  end

  def confirmed
    success = false
    if takeout
      if pay_method == 'online' && status.payed?
        success = update_attributes(:status => 'confirmed')
      elsif pay_method == 'offline' && status.pending?
        success = update_attributes(:status => 'confirmed')
      end
    end
    success
  end

  def express
    success = false
    if takeout && status.express?
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

end
