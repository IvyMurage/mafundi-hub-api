class UserRolesController < ApplicationController
  before_action :authenticate_user!

  def add_user_role
    user = User.find(params[:user_id])

    user.add_role(:client) if role === "client"
    user.add_role(:handyman) if role === "handyman"
    user.add_role(:admin) if role === "admin"

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
