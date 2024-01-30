class MafundiUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :avatar_url
  has_many :roles
  has_one :handyman
  has_one :client
end
