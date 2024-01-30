class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :user_id, :user_role
  has_many :roles

  def user_role
    object.roles.first.name
  end

  def user_id
    object.client.id if user_role == "client"
    objcet.handyman.id if user_role == "handyman"
  end
end
