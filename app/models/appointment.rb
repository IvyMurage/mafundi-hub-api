class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :task
  belongs_to :handyman
end
