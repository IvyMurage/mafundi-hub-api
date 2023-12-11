class Review < ApplicationRecord
  belongs_to :handyman
  belongs_to :client
  validates :comment, presence: true
  validates :comment, length: {
                        maximum: 1800,
                      }
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, message: "can only be a whole number between 0 and 5" }
  validates :handyman_id, uniqueness: { scope: :client_id, message: "You already have a review for this handyman." } # Task description must be unique per client.
end
