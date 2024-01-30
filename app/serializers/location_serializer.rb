class LocationSerializer < ActiveModel::Serializer
  attributes :city, :county, :country, :longitude, :latitude
end
