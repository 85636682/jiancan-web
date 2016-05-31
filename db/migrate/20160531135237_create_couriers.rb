class CreateCouriers < ActiveRecord::Migration
  def change
    create_table :couriers do |t|
      t.string :login
      t.string :password_digest
      t.string :name
      t.string :private_token
      t.string :mobile

      t.timestamps null: false
    end
  end
end
