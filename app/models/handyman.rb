class Handyman < ApplicationRecord
  serialize :handyman_skills, Array, coder: JSON
  belongs_to :user
  has_one :handyman_media
  belongs_to :service
  has_one :location, as: :locationable, dependent: :destroy
  accepts_nested_attributes_for :location
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :service_id, presence: true

  # search scope
  scope :search_by_query, ->(query) {
          where(
            "title ILIKE :query OR description ILIKE :query OR handyman_skills ILIKE :query OR year_of_experience ILIKE :query",
            query: "%#{sanitize_sql_like(query)}%",
          ) if query.present?
        }

  # adding filters
  scope :by_location, ->(city) { joins(:location).where(locations: { city: city }) }
end
