class AddExpressStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :express_status, :string, default: :halt
  end
end
