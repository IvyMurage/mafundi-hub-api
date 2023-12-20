class Appointment < ApplicationRecord
  before_validation :set_default_values
  belongs_to :client
  belongs_to :task
  belongs_to :job_proposal
  belongs_to :handyman
  validates presence: :client
  validates presence: :task
  validates presence: :handyman
  validates :duration, numericality: { greater_than_or_equal_to: 0 }
  validates :appointment_status, inclusion: { in: %w[scheduled confirmed canceled] }

  def set_default_values
    self.appointment_status ||= "scheduled"
    self.appointment_notes ||= ""
    self.duration ||= 0
    self.appointment_date ||= Time.current.to_date + 1.day
    self.appointment_time ||= Time.current
  end
end
