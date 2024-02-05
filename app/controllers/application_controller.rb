class ApplicationController < ActionController::API
  # rescue_from blocks allow you to define handlers for different types of exceptions
  # This one handles the CanCan::AccessDenied exception, which is raised when a user does not have the necessary permissions
  rescue_from CanCan::AccessDenied, with: :render_access_denied_response

  # This block handles the ActiveRecord::RecordInvalid exception, which is raised when a record is invalid and cannot be saved
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  # The before_action method allows you to define a method that should be called before any of the controller's actions
  # Here, we use it to configure permitted parameters when using the Devise gem for authentication
  before_action :configure_permitted_parameters, if: :devise_controller?

  # rescue from unauthorization error

  rescue_from Devise::FailureApp do |exception|
    render json: { error: "You need to sign in or sign up before continuing." }, status: :unauthorized
  end

  protected

  # This method is used to configure the parameters that can be sent when creating or updating a user account
  # In this case, we are allowing the upload of an avatar image
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private

  # This method checks if the current user has the "client" role
  def current_user_is_client?
    current_user.role == "client"
  end

  # This method is used to render a JSON response with a status of 403 (Forbidden) when a user tries to access a resource they do not have permission for
  def render_access_denied_response
    render json: { message: "Access denied" }, status: :forbidden
  end

  # This method is used to render a JSON response with a status of 422 (Unprocessable Entity) when a record is invalid and cannot be saved
  def render_unprocessable_entity(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
