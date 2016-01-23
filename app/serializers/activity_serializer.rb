class ActivitySerializer < BaseSerializer
  attributes :id, :title, :details, :amount, :status, :status_text, :deadline,
             :handle, :created_at, :updated_at, :likes

  has_many :activity_users
  has_many :activity_products

  def status_text
    object.status.text
  end
end
