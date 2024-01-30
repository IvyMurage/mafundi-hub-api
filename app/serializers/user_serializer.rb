class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :roles

  def user_role
    object.roles.first.name
  end

  def user_id
    object.client.id if user_role == "client"
    objcet.handyman.id if user_role == "handyman"
  end
end
