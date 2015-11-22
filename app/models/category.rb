class Category < ActiveRecord::Base
  belongs_to :shop
  has_many :products

  validates :name, :shop_id, presence: true
  validates :name, uniqueness: true
end
