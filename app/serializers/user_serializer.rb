class UserSerializer < BaseSerializer
  attributes :id, :name, :nickname, :avatar

  has_many :receiving_addresses
end
