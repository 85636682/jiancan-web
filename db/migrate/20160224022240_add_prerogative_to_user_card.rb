class AddPrerogativeToUserCard < ActiveRecord::Migration
  def change
    add_column :user_cards, :prerogative, :string
    add_column :user_cards, :auto_activate, :boolean, default: true
    add_column :user_cards, :wx_activate, :boolean, default: false
    add_column :user_cards, :supply_bonus, :boolean, default: true
    add_column :user_cards, :bonus_url, :string
    add_column :user_cards, :supply_balance, :boolean, default: true
    add_column :user_cards, :balance_url, :string
    add_column :user_cards, :bonus_rules, :string
    add_column :user_cards, :balance_rules, :string
    add_column :user_cards, :activate_url, :string
    add_column :user_cards, :cost_money_unit, :integer, default: 10
    add_column :user_cards, :increase_bonus, :integer, default: 10
    add_column :user_cards, :max_increase_bonus, :integer, default: 1000
    add_column :user_cards, :init_increase_bonus, :integer, default: 10
    add_column :user_cards, :cost_bonus_unit, :integer, default: 10
    add_column :user_cards, :reduce_money, :integer, default: 10
    add_column :user_cards, :least_money_to_use_bonus, :integer, default: 100
    add_column :user_cards, :max_reduce_bonus, :integer, default: 10
    add_column :user_cards, :discount, :integer, default: 10
  end
end
