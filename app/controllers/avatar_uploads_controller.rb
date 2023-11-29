class AvatarUploadsController < ApplicationController
  before_action :authenticate_user!

  def upload
    if params[:avatar].present?
      current_user.avatar.attach(params[:avatar])
      render json: { status: "Avatar uploaded successfully", url: url_for(current_user.avatar) }
    else
      render json: { error: "Avatar not provided" }, status: :unprocessable_entity
    end
  end

  def avatar_params
    params.permit(:avatar)
  end
end
