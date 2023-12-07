class HandymanMediaController < ApplicationController
  before_action :authenticate_user!

  def upload
    if params[:handyman_id].present?
      @handyman = Handyman.find(params[:handyman_id])
      byebug
      @handyman.work_photos.attach(params[:work_photos])
      work_photo_urls = @handyman.work_photos.map do |photo|
        url_for(photo)
      end
      render json: { status: "success", message: "Upload successful!", work_photos: work_photo_urls }, status: :ok
    else
      render json: { error: "Photos not provided" }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def media_params
    params.permit(work_photos: [])
  end
end
