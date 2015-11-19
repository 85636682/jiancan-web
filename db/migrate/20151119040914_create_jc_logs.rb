class CreateJcLogs < ActiveRecord::Migration
  def change
    create_table :jc_logs do |t|
      t.text :content
      t.string :level
      t.string :code

      t.timestamps null: false
    end
  end
end
