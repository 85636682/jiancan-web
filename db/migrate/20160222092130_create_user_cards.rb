class CreateUserCards < ActiveRecord::Migration
  def change
    create_table :user_cards do |t|
      t.string :logo
      t.string :brand_name
      t.string :title
      t.string :color
      t.string :notice
      t.string :description
      t.string :service_phone
      t.string :sku
      t.string :date_info
      t.integer :shop_id

      t.timestamps null: false
    end
  end
end
