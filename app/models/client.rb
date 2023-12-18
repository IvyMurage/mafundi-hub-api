class Client < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :location, as: :locationable, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :handymen, through: :appointments

  accepts_nested_attributes_for :location
end
