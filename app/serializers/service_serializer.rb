class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name
  # has_many :tasks
end
