class ReviewSerializer < ActiveModel::Serializer
  attributes :id,
    :comment,
    :rating,
    :client_name,
    :client_avatar,
    :created_at,
    :handyman_id,
    :client_id

  def client_name
    "#{object.client.first_name} #{object.client.last_name}"
  end

  def client_id
    object.client.id
  end

  def client_avatar
    object.client.user.avatar_url
  end

  def created_at
    object.created_at.strftime("%B %d, %Y")
  end
end
