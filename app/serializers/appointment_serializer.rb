class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :appointment_date, :duration, :appointment_notes, :appointment_status
  has_one :client
  has_one :task
  has_one :handyman
end
