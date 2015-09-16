class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :imei
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
