class AllTaskSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :service_name, :job_price, :duration_label, :created_at

  has_one :location

  type :task

  def links
    [{
      rel: :self,
      href: task_path(object),

    }]
  end

  def service_name
    object.service.service_name
  end
end
