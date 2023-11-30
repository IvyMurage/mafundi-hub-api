class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    render json: @location
  end

  def create
    byebug
    @location = Location.create!(location_params)
    render json: @location, status: :created
  end

  def geocode_address
    byebug
    if params[:address].present?
      @location = Geocoder.search(params[:address])
      render json: { latitude: @location[0].latitude, longitude: @location[0].longitude }
    else
      render json: { error: "Address not provided" }, status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.permit(:county, :city, :country)
  end
end
