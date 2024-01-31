class UserRolesController < ApplicationController
  before_action :authenticate_user!, except: [:add_user_role]

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

    render json: { user: UserSignupSerializer.new(user), status: "User role updated successfully" }
  end

  private

  def user_role_params
    params.permit(
      :role,
      :user_id
    )
  end
end
