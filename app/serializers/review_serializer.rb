class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :task_id, :rating, :handyman_id
end
