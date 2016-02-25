class AddBonusAndBalanceToUserCardUser < ActiveRecord::Migration
  def change
    add_column :user_card_users, :bonus, :integer
    add_column :user_card_users, :balance, :decimal
  end
end
