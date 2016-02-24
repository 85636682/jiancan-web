class CreateAddBonusClearedToUserCards < ActiveRecord::Migration
  def change
    create_table :add_bonus_cleared_to_user_cards do |t|
      t.string :bonus_cleared

      t.timestamps null: false
    end
  end
end
