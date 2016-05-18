class OrderProduct < ActiveRecord::Base
  extend Enumerize  #pending 新建状态  cooking烹饪状态  finished完成状态  canceled取消
  enumerize :status,     in: [:pending, :cooking, :finished, :canceled], default: :pending

  belongs_to :order
  belongs_to :product
  has_one :comment, as: :commentable

  def self.find_quantity(product_id, order_id)
    where(:product_id => product_id, :order_id => order_id).first.quantity
  end

  def comment_on
    update_attributes(:commented => true)
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

  def notify_change_status
    begin
      workers = Worker.where(:shop_id => order.shop.id)
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
            '有菜色状态改变了，请及时查看！'
          ).set_android(
            alert: '有菜色状态改变了，请及时查看！',
            extras:  { "status" => status, "status_text" => status.text, "sn" => order.sn }
          ).set_ios(
            alert: '有菜色状态改变了，请及时查看！',
            extras: { "status" => status, "status_text" => status.text, "sn" => order.sn }
          )
        ).set_message(
          msg_content: "有菜色状态改变了，请及时查看！",
          title: "有菜色状态改变了，请及时查看！",
          content_type: "product_status",
          extras: { "status" => status, "status_text" => status.text, "sn" => order.sn }
        )
        res = client.pusher.push(payload)
      end
    rescue Exception => e
      JcLog.create(content: "#{e.message}", level: "debug")
    end
  end

  after_create :update_sales_volume
  def update_sales_volume
    sales_volume = product.sales_volume ||= 0
    product.update(:sales_volume => sales_volume + 1)
  end
end
