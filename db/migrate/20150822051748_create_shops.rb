class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :mobile
      t.string :avatar
      t.string :province
      t.string :city
      t.string :district
      t.integer :merchant_id

      t.timestamps null: false
    end
  end
end
