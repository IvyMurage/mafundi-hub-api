class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating, :client_name, :client_avatar, :created_at, :handyman_id

  def client_name
    object.client.name
  end

  def client_avatar
    object.client.user.avatar.url
  end

  def created_at
    object.created_at.strftime("%B %d, %Y")
  end
end
