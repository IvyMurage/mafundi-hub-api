class AllTaskSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :service_name, :job_price, :duration_label, :created_at, :availability

  has_one :location

  type :task

  def links
    [{
      rel: :self,
      href: task_path(object),

    }]
  end

  def created_at
    object.created_at.strftime("%B %d, %Y, %H:%M")
  end

  def service_name
    object.service.service_name
  end
end
