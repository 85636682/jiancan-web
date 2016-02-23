class UserCardUser < ActiveRecord::Base
  belongs_to :user_card
  belongs_to :user
end
