class MafundiUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :avatar_url
  has_many :roles
end
