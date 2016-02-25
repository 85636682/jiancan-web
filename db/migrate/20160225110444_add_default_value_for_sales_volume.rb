class AddDefaultValueForSalesVolume < ActiveRecord::Migration
  def change
    change_column_default :products, :sales_volume, 0
  end
end
