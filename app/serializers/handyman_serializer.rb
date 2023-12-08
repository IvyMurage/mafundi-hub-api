class HandymanSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :year_of_experience, :availability, :phone_number, :user_email, :service_name, :description, :handyman_skills, :media_url

  has_one :location, as: :locationable

  def user_email
    UserSerializer.new(object.user).attributes[:email]
  end

  def service_name
    object.service.service_name
  end
end
