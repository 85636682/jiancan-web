class CreateReceivingAddresses < ActiveRecord::Migration
  def change
    create_table :receiving_addresses do |t|
      t.string :consignee
      t.string :mobile
      t.string :province
      t.string :city
      t.string :district
      t.string :street
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
