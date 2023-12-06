class HandymanMediaController < ApplicationController
  before_action :authenticate_user!

  def upload
    if params[:work_photos].present?
      HandymanMedium.work_photos.attach(params[:work_photos])
      HandymanMedium.work_photos_url = url_for(HandymanMedium.work_photos)
      HandymanMedium.save!
      render json: { message: "Avatar uploaded successfully", user: current_user }, status: :created
    else
      render json: { error: "Avatar not provided" }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def media_params
    params.permit(:work_photos)
  end
end
