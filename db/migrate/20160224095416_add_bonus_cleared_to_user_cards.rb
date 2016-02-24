class AddBonusClearedToUserCards < ActiveRecord::Migration
  def change
    add_column :user_cards, :bonus_cleared, :string
  end
end
