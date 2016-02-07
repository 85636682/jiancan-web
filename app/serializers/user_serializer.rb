class UserSerializer < BaseSerializer
  attributes :id, :name, :nickname, :avatar, :private_token

  has_many :receiving_addresses
end
