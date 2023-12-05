class TaskSerializer < ActiveModel::Serializer
  # Return an array of attributes to be serialized.

  attributes :id, :job_title, :task_description, :job_price, :duration_label, :service_name, :task_responsibilities

  # Define a one-to-one association between Task and Location models.
  has_one :location

  # Override the default method for fetching the service_name attribute.
  # This custom implementation fetches the service_name from the associated service model.
  def service_name
    object.service.service_name
  end

  # Return metadata about
end
