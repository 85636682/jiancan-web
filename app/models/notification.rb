class Notification < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :order

  scope :unread, -> { where(read: false) }

  delegate :url_helpers, to: 'Rails.application.routes'

  after_create :realtime_push_to_client
  after_update :realtime_push_to_client
  def realtime_push_to_client
    if merchant
      hash = notify_hash
      hash[:count] = merchant.notifications.unread.count
      MessageBus.publish "/notifications_count/#{merchant.private_token}", hash
    end
  end

  def notify_hash
    return {} if order.blank?
    {
      title: title,
      content: content,
      content_path: content_path
    }
  end

  def title
    "有新订单"
  end

  def content
    return '' if order.blank?
    "订单编号：#{order.sn}"
  end

  def content_path
    return '' if order.blank?
    url_helpers.cpanel_order_path(order.id)
  end
end
