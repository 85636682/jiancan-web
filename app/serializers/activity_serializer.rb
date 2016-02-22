class ActivitySerializer < BaseSerializer
  attributes :id, :title, :details, :amount, :status, :status_text, :deadline,
             :handle, :handle_text, :created_at, :updated_at, :likes, :avatar

  has_many :activity_users
  has_many :activity_products

  def avatar
    object.avatar.url("80x80")
  end

  def status_text
    object.status.text
  end

  def handle_text
    object.handle.text
  end
end
