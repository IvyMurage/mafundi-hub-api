class ServiceCategory < ApplicationRecord
  has_many :services, dependent: :destroy
  validates :category_name, presence: true, uniqueness: true
end
