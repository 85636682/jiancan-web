class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def self.find_quantity(product_id, order_id)
    where(:product_id => product_id, :order_id => order_id).first.quantity
  end
end
