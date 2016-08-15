class Room < ApplicationRecord
  belongs_to :shop
  has_many :orders
  has_many :bookings, as: :bookingable

  validates :name, :shop_id, presence: true
end
