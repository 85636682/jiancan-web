class CreateUserCardUsers < ActiveRecord::Migration
  def change
    create_table :user_card_users do |t|
      t.integer :user_card_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
