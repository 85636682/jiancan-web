class UserCardSerializer < BaseSerializer
  attributes :id, :title, :color, :notice, :description, :service_phone, :sku,
             :date_info, :shop_id, :created_at, :updated_at, :logo, :prerogative,
             :auto_activate, :wx_activate, :supply_bonus, :bonus_url,
             :supply_balance, :balance_url, :bonus_rules, :balance_rules,
             :activate_url, :cost_money_unit, :increase_bonus, :max_increase_bonus,
             :init_increase_bonus, :cost_bonus_unit, :reduce_money,
             :least_money_to_use_bonus, :max_reduce_bonus, :discount, :bonus_cleared,
             :balance_rules, :bonus_rules

  has_one :shop
  has_many :user_card_users

  def logo
    object.logo.url("80x80")
  end
end
