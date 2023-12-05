class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied, with: :render_access_denied_response

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private

  def current_user_is_client?
    current_user.role == "client"
  end

  def render_access_denied_response
    render json: { message: "Access denied" }, status: :forbidden
  end
end
