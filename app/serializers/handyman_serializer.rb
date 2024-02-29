class HandymanSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :title,
             :year_of_experience,
             :availability,
             :phone_number,
             :user_email,
             :service_name,
             :description,
             :handyman_skills,
             :media_url,
             :avatar_url

  has_one :location, as: :locationable
  has_many :reviews

  def user_email
    UserSerializer.new(object.user).attributes[:email]
  end

  def service_name
    object.service.id
  end

  def avatar_url
    object.user.avatar.url
  end
end
