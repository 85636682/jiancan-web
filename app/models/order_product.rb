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
end
