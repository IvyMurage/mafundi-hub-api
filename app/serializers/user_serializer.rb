class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :user_id, :user_role

  def user_role
    object.roles.first.name
  end

  def user_id
    object.client.id if user_role === "client"
    object.handyman.id if user_role === "handyman"
  end
end
