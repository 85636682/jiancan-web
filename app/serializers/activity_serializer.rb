class ActivitySerializer < BaseSerializer
  attributes :id, :title, :details, :amount, :status, :status_text, :deadline,
             :handle, :created_at, :updated_at

  has_many :activity_users
  has_many :activity_products
end
