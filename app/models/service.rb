class Service < ApplicationRecord
  validates :service_name, presence: true, uniqueness: true
  belongs_to :service_category
  has_many :tasks, dependent: :destroy
end
