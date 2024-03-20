class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  wrap_parameters format: []

  def create
    @user = User.find_by(email: user_params[:email])
    if @user&.authenticate(user_params[:password])
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), token: @token }, status: :created
      byebug
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
