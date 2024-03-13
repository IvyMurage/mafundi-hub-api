class AppointmentSerializer < ActiveModel::Serializer
  attributes :id,
             :appointment_date,
             :duration,
             :appointment_notes,
             :appointment_status,
             :handyman_name,
             :handyman_id,
             :task_name,
             :client_name

  def handyman_name
    "#{object.handyman.first_name} #{object.handyman.last_name}"
  end

  def task_name
    "#{object.task.job_title}"
  end

  def client_name
    "#{object.client.first_name} #{object.client.last_name}"
  end
end
