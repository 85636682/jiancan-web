class BookingSerializer < BaseSerializer
  attributes :id, :shop_id, :user_id, :bookingable_id, :bookingable_type

  has_one :shop
  has_one :bookingable, :polymorphic => true
end
