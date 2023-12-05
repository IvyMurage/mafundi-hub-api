class LocationSerializer < ActiveModel::Serializer
  attributes :city, :county, :longitude, :latitude
end
