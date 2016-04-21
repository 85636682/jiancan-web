class AddExpressChargeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :express_charge, :integer, default: 0
  end
end
