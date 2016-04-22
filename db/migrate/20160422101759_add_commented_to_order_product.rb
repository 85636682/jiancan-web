class AddCommentedToOrderProduct < ActiveRecord::Migration
  def change
    add_column :order_products, :commented, :boolean, default: false
  end
end
