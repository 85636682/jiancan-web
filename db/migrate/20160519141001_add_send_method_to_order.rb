class AddSendMethodToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :send_method, :string
  end
end
