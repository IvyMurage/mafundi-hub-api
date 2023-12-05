class TaskSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :task_description, :job_price, :duration_label, :service_name

  has_one :location

  def service_name
    object.service.service_name
  end

  def meta
    pagination_meta
  end
end
