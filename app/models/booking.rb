class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop
  belongs_to :bookingable, :polymorphic => true
end
