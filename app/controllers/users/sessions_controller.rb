# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  wrap_parameters format: []
  include RackSessionsFix
  respond_to :json

  private

  def sign_in_params
    params.permit(:email, :password)
  end

  def respond_with(current_user, _opts = {})
    # byebug
    render json: {
             message: "Logged in sucessfully.",
             user: UserSerializer.new(current_user),
           },
           status: :ok
  end

  def respond_to_on_destroy
    if request.headers["Authorization"].present?
      jwt_payload = JWT.decode(request.headers["Authorization"].split(" ").last,
                               Rails.application.credentials.devise_jwt_secret_key!).first,
      current_user = User.find(jwt_payload["sub"])
    end
    if current_user
      current_user.update(jti: SecureRandom.uuid)
      render json: {
               status: { code: 200, message: "Logged out sucessfully." },
             }, status: :ok
    else
      render json: {
               status: { message: "Couldn't find an active session." },
             }, status: :unauthorized
    end
  end
end
