class TaskSerializer < ActiveModel::Serializer
  attributes :id

  def meta
    pagination_meta
  end
end
