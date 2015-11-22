class Room < ActiveRecord::Base
  belongs_to :shop
  has_many :orders

  validates :name, :shop_id, presence: true
  validates :name, uniqueness: true
end
