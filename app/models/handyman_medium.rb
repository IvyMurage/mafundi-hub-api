class HandymanMedium < ApplicationRecord
  serialize :media_urls, Array, coder: JSON
  belongs_to :handyman
  has_many_attached :work_photos
end
