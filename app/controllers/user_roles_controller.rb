class UserRolesController < ApplicationController
  skip_before_action :authenticate_user!

  def add_user_role
    user = User.find(params[:user_id])

    case user_role_params[:role]
    when "client"
      user.add_role(:client)
    when "handyman"
      user.add_role(:handyman)
    when "admin"
      user.add_role(:admin)
    else
      render json: { error: "Invalid role provided" }, status: :unprocessable_entity
      return
    end

    render json: { status: "User role updated successfully" }
  end

  private

  def user_role_params
    params.permit(
      :role,
      :user_id
    )
  end
end
