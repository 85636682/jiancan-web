class ActivitySerializer < BaseSerializer
  attributes :id, :title, :details, :amount, :status, :status_text, :deadline,
             :handle, :handle_text, :created_at, :updated_at, :likes, :avatar

  has_many :activity_users
  has_many :activity_products
  has_one :shop, serializer: ShopSerializer

  def avatar
    object.avatar.url("80x80")
  end

  def status_text
    object.status.text
  end

  def handle_text
    object.handle.text
  end

  def created_at
    DateTime.parse(object.created_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end

  def updated_at
    DateTime.parse(object.updated_at.iso8601).strftime('%Y年%m月%d日 %H:%M')
  end
end
