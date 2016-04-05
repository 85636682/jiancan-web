class ChangeColumnForBooking < ActiveRecord::Migration
  def change
    change_column :bookings, :confirmed, :string
  end
end
