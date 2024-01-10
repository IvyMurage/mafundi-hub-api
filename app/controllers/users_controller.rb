class UsersController < ApplicationController
  # Before action to authenticate the user using devise gem
  # before_action :authenticate_user!

  # Before action to load and authorize the resource using cancancan gem
  # load_and_authorize_resource

  # Wrap the request parameters in a hash with format key
  wrap_parameters format: []
  include Pagination

  # Rescue from ActiveRecord::RecordInvalid exception and render unprocessable entity response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  # Rescue from ActiveRecord::RecordNotFound exception and render user not found response
  rescue_from ActiveRecord::RecordNotFound, with: :render_user_not_found

  # Search users by query parameter in the username or email fields
  def search
    if params[:query].present?
      # Search users with case-insensitive and accent-insensitive matching
      @users = User.where("username ILIKE ? OR email ILIKE?",
                          "%#{User.sanitize_sql_like(params[:query])}%",
                          "%#{User.sanitize_sql_like(params[:query])}%")
      # Render the search results as JSON using the MafundiUserSerializer
      render json: @users, each_serializer: MafundiUserSerializer, status: :ok
    end
  end

  # Index action to list all users with pagination
  def index
    # Set the users with pagination and per_page parameter or default to 10
    @users = User.page(params[:page]).per(params[:per_page] || 10)
    # Render the users list as JSON with pagination metadata
    render json: { meta: pagination_meta(@users), users: users_json }, status: :ok
  end

  # Show action to display a single user by id
  def show
    # Set the user by id and render it as JSON using the MafundiUserSerializer
    @user = set_user
    render json: @user, serializer: MafundiUserSerializer, status: :ok
  end

  # Create action to create a new user with the given parameters
  def create
    # Create a new user with the sanitized parameters and render it as JSON with created status
    @user = User.create!(user_params)
    render json: @user, serializer: MafundiUserSerializer, status: :created
  end

  # Update action to update an existing user with the given parameters
  def update
    # Set the user by id and update it with the sanitized parameters
    @user = set_user
    @user.update!(user_params)
    # Render the updated user as JSON with ok status
    render json: @user, serializer: MafundiUserSerializer, status: :ok
  end

  # Private methods
  private

  # Set the user by id or raise RecordNotFound exception
  def set_user
    User.find(params[:id])
  end

  def users_json
    ActiveModelSerializers::SerializableResource.new(@users, each_serializer: MafundiUserSerializer).as_json
  end

  # Filter the user parameters for mass assignment
  def user_params
    params.permit(:email, :password, :password_confirmation, :avatar_url)
  end

  # Render user not found response for RecordNotFound exception
  def render_user_not_found
    render json: { error: "User not found" }, status: :not_found
  end
end
