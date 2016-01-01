class AddWorkerIdToOrderProduct < ActiveRecord::Migration
  def change
    add_column :order_products, :worker_id, :integer
  end
end
