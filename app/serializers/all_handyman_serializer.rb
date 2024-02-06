class AllHandymanSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :year_of_experience, :availability, :user_rating

  has_one :location, as: :locationable, serializer: LocationSerializer

  def user_rating
    object.reviews.average(:rating).to_f
  end
end
