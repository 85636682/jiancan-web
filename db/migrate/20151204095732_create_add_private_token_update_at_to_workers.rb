class CreateAddPrivateTokenUpdateAtToWorkers < ActiveRecord::Migration
  def change
    create_table :add_private_token_update_at_to_workers do |t|
      t.datetime :private_token_updated_at

      t.timestamps null: false
    end
  end
end
