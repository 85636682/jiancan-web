class Category < ActiveRecord::Base
  belongs_to :shop
  has_many :products
end
