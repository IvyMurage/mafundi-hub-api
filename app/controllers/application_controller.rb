class ApplicationController < ActionController::API
  # wrap_parameters format: []

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  def sign_in_params
    byebug
    params.permit(:email, :password)
  end
end
