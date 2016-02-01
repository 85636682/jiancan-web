class CategorySerializer < BaseSerializer
  attributes :id, :name, :products_count, :avatar

  def avatar
    object.avatar.url("80x80")
  end

  def products_count
    object.products.count
  end
end
