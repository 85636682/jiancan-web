class AddBalanceAndPointsAndBriberyMoneySomeColumn < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal, default: 0.0
    add_column :users, :points, :integer, default: 0
    add_column :users, :bribery_money, :decimal, default: 0.0
  end
end
