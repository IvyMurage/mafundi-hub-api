class AvatarUploadsController < ApplicationController
  before_action :authenticate_user! # Ensure a user is authenticated before making requests

  # Upload avatar action
  def upload
    if params[:avatar].present? # Check if avatar param is present
      current_user.avatar.attach(params[:avatar]) # Attach the avatar to the current user
      if current_user.save(context: :avatar_upload) # Save the user with the new avatar
        # Update the avatar_url with the new Google Cloud Storage URL
        current_user.avatar_url = gcs_avatar_url(current_user.avatar.key.to_s)
        current_user.save! # Save the user again to update the avatar_url
        render json: { # Respond with a JSON success message
                 message: "Avatar uploaded successfully",
                 user: current_user,
               },
               status: :created
      else
        render json: { # Respond with a JSON error message
                 error: current_user.errors.full_messages,
               },
               status: :unprocessable_entity
      end
    else
      render json: { # Respond with a JSON error message
               error: "Avatar not provided",
             },
             status: :unprocessable_entity
    end
  end

  # Update avatar action
  def update
    current_user.avatar.purge_later if current_user.avatar.attached? # Check if the user already has an avatar attached && # Purge the existing avatar
    current_user.avatar.attach(params[:avatar]) # Attach the new avatar
    # Update the avatar_url with the new Google Cloud Storage URL
    current_user.avatar_url = gcs_avatar_url(current_user.avatar.key.to_s)
    current_user.save! # Save the user to update the avatar and avatar_url
    render json: { # Respond with a JSON success message
             message: "Avatar updated successfully",
             url: current_user.avatar_url,
           },
           status: :ok
  end

  private

  def avatar_params
    params.permit(:avatar) # Only allow the avatar param
  end

  def gcs_avatar_url(key)
    "https://storage.googleapis.com/#{Rails.application.credentials.google_profile_bucket}/#{key}"
  end
end
