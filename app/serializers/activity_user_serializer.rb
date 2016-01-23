class ActivityUserSerializer < BaseSerializer
  attributes :id, :activity_id, :user_id, :likes, :created_at, :updated_at

  has_one :user
end
