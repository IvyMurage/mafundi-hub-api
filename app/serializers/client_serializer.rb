class ClientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number, :user_email
  # belongs_to :user
  has_one :location, as: :locationable

  def user_email
    UserSerializer.new(object.user).attributes[:email]
  end
end
