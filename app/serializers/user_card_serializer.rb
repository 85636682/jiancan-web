class UserCardSerializer < BaseSerializer
  attributes :id, :title, :color, :notice, :description, :service_phone, :sku,
             :date_info, :shop_id, :created_at, :updated_at

  has_one :shop
end
