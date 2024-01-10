class AvatarUploadsController < ApplicationController
  before_action :authenticate_user!

  def upload
    if params[:avatar].present?
      current_user.avatar.attach(params[:avatar])
      if current_user.save(context: :avatar_upload)
        current_user.avatar_url = "https://storage.googleapis.com/#{Rails.application.credentials.google_profile_bucket}/#{current_user.avatar.key.to_s}"

        current_user.save!
        render json: { message: "Avatar uploaded successfully", user: current_user }, status: :created
      else
        render json: { error: current_user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Avatar not provided" }, status: :unprocessable_entity
    end
  end

  def update
    if current_user.avatar.attached?
      current_user.avatar.purge
    end
    current_user.avatar.attach(params[:avatar])
    current_user.avatar_url = "https://storage.googleapis.com/#{Rails.application.credentials.google_profile_bucket}/#{current_user.avatar.key.to_s}"
    current_user.save!
    render json: { message: "Avatar updated successfully", url: current_user.avatar_url }, status: :ok
  end

  private

  def avatar_params
    params.permit(:avatar)
  end
end
