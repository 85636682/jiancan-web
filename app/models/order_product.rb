class OrderProduct < ActiveRecord::Base
  extend Enumerize  #pending 新建状态  cooking烹饪状态  finished完成状态  canceled取消
  enumerize :status,     in: [:pending, :cooking, :finished, :canceled], default: :pending

  belongs_to :order
  belongs_to :product

  after_create :update_sales_volume
  def update_sales_volume
    sales_volume = product.sales_volume ||= 0
    product.update(:sales_volume => sales_volume + 1)
  end

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

  def push_to_kitchen

  end
end
