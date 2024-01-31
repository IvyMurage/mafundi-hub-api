# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: "Signed up sucessfully." },
        user: UserSignupSerializer.new(current_user),
      }
      UserMailer.with(user: current_user).welcome_email.deliver_now
    else
      render json: {
        status: { message: "User couldn't be created successfully.", errors: resource.errors.full_messages },
      }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.permit(:email, :password, :password_confirmation, :current_password)
  end
end
