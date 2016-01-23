class ActivityProductSerializer < BaseSerializer
  attributes :id, :activity_id, :product_id, :amount, :created_at, :updated_at

  has_one :product
end
