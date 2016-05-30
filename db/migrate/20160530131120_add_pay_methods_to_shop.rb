class AddPayMethodsToShop < ActiveRecord::Migration
  def change
    add_column :shops, :pay_methods, :string, array: true, default: ['online', 'offline']

    add_index :shops, :pay_methods, using: 'gin'
  end
end
