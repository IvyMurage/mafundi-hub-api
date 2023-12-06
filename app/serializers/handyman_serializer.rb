class HandymanSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :year_of_experience, :description, :handyman_skills, :availability, :phone_number, :user_email, :service_name

  has_one :location, as: :locationable

  def user_email
    UserSerializer.new(object.user).attributes[:email]
  end

  def service_name
    object.service.service_name
  end
end
