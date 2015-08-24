class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :sn
      t.boolean :takeout
      t.decimal :total_price
      t.string :status
      t.integer :shop_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
