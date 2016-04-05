class BookingSerializer < BaseSerializer
  attributes :id, :shop_id, :user_id, :bookingable_id, :bookingable_type,
             :booking_time, :confirmed, :confirmed_text

  has_one :shop
  has_one :bookingable, :polymorphic => true

  def booking_time
    DateTime.parse(object.booking_time.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def confirmed_text
    object.confirmed.text
  end
end
