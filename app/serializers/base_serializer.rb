class BaseSerializer < ActiveModel::Serializer
  delegate :current_merchant, to: :scope, allow_nil: true

  def owner?(obj = nil)
    return false if current_merchant.blank?

    obj = object if obj.blank?
    if obj.is_a?(Merchant)
      return obj.id == current_merchant.id
    else
      return obj.merchant_id == current_merchant.id
    end
  end

  def cache(keys = [])
    Rails.cache.fetch(['serializer', *keys]) do
      yield
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_merchant)
  end

  def can?(*args)
    current_ability.can?(*args)
  end

  def abilities
    { update: can?(:update, object), destroy: can?(:destroy, object) }
  end
end