class UserSerializer < BaseSerializer
  attributes :id, :name, :nickname, :avatar, :mobile, :wx_avatar,
             :balance, :points, :bribery_money

  has_many :receiving_addresses

  def avatar
    object.avatar.url("320xAuto")
  end
end
