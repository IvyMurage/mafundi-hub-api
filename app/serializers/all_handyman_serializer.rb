class AllHandymanSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :year_of_experience, :availability, :user_rating, :avatar_url

  has_one :location, as: :locationable, serializer: LocationSerializer

  def user_rating
    object.reviews.average(:rating).to_f
  end

  def avatar_url
    object.user.avatar.url
  end
end
