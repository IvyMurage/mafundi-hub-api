class Client < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :handymen, through: :appointments

  accepts_nested_attributes_for :location

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  # validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :user_id, message: "Already exists." } # Task description must be unique per client.
end
