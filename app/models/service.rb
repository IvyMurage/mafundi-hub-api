class Service < ApplicationRecord
  validates :service_name, presence: true, uniqueness: true
  belongs_to :service_category
end
