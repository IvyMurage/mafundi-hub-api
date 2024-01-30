class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :roles
  has_one :client
end
