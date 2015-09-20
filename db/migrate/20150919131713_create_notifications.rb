class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :content
      t.string :content_path
      t.integer :merchant_id

      t.timestamps null: false
    end
  end
end
