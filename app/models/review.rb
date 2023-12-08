class Review < ApplicationRecord
  belongs_to :handyman
  belongs_to :client
end
