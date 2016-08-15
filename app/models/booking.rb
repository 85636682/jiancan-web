class Booking < ApplicationRecord
  extend Enumerize  #pending 订单新建状态  settled订单结算状态  completed 订单完成支付  canceled订单取消
  enumerize :confirmed,     in: [:unconfirm, :confirmed, :canceled], default: :unconfirm

  belongs_to :user
  belongs_to :shop
  belongs_to :bookingable, :polymorphic => true
end
