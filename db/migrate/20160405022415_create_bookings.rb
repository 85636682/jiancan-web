class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :shop_id
      t.string :bookingable_type
      t.integer :bookingable_id
      t.datetime :booking_time
      t.integer :user_id
      t.boolean :confirmed, default: false

      t.timestamps null: false
    end
  end
end
