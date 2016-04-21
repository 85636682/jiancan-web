class ChangeExpressChargeWithOrder < ActiveRecord::Migration
  def change
    change_column :orders, :express_charge, :decimal
  end
end
