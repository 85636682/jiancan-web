class CreateActivityUsers < ActiveRecord::Migration
  def change
    create_table :activity_users do |t|
      t.integer :activity_id
      t.integer :user_id
      t.integer :likes

      t.timestamps null: false
    end
  end
end
