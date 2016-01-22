class CategorySerializer < BaseSerializer
  attributes :id, :name, :products_count

  def products_count
    object.products.count
  end
end
