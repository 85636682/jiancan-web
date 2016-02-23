class UserCardUserSerializer < BaseSerializer
  attributes :id, :user_card_id, :user_id, :created_at, :updated_at

  has_one :user
end
