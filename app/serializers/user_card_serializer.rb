class UserCardSerializer < BaseSerializer
  attributes :id, :title, :color, :notice, :description, :service_phone, :sku,
             :date_info, :shop_id, :created_at, :updated_at, :logo

  has_one :shop

  def logo
    object.logo.url("80x80")
  end
end
