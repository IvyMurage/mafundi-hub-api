class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :user_id, :user_role

  def user_role
    object.roles.first.name
  end

  def user_id
    if object.user_role == "client"
      object.client.id
    elsif object.user_role == "handyman"
      object.handyman.id
    end
  end
end
