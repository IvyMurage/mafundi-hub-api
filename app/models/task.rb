# The Task class is an ActiveRecord model that represents a specific task performed for a client.
# Each task belongs to a client and a service, and has one location.
# Tasks are validated for the presence of task_description, job_price, job_title, location, and their uniqueness.
class Task < ApplicationRecord
  serialize :task_responsibilities, type: Array, coder: JSON
  belongs_to :client # A task belongs to a client.
  belongs_to :service # A task belongs to a service.
  # belongs_to :locationable, polymorphic: true

  has_one :location, as: :locationable, dependent: :destroy # A task has one location.
  accepts_nested_attributes_for :location # Allows for updating a task's location using nested attributes.

  validates :task_description, presence: true # Task description is required.
  validates :job_price, presence: true # Job price is required.
  validates :job_title, presence: true # Job title is required.
  validates :location, presence: true # Location is required.

  validates :task_description, uniqueness: { scope: :client_id, message: "You already have a task with this description." } # Task description must be unique per client.

  # adding filters
  scope :by_service, ->(service_id) { where(service_id: service_id) }
  scope :by_location, ->(city) { joins(:location).where(locations: { city: city }) }
  scope :by_job_price, ->(job_price) { where(job_price: job_price) }
end
