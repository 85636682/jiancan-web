class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :shop_id
      t.string :title
      t.text :details
      t.datetime :deadline
      t.string :status
      t.integer :amount
      t.string :handle

      t.timestamps null: false
    end
  end
end
