class CurrentUserSerializer < BaseSerializer
  attributes :id, :name, :nickname, :avatar, :mobile, :wx_avatar,
             :balance, :points, :bribery_money, :access_token

  has_many :receiving_addresses

  def avatar
    object.avatar.url("320xAuto")
  end

  def access_token
    object.private_token
  end
end
