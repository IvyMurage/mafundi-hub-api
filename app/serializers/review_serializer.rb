class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating, :handyman_id
end
