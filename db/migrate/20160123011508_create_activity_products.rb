class CreateActivityProducts < ActiveRecord::Migration
  def change
    create_table :activity_products do |t|
      t.integer :activity_id
      t.integer :product_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
