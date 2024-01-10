class UsersController < ApplicationController
  before_action :authenticate_user!
  #   load_and_authorize_resource
  include Pagination

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_user_not_found

  wrap_parameters format: []

  def search
    if params[:query].present?
      @users = User.where("username ILIKE ? OR email ILIKE?",
                          "%#{User.sanitize_sql_like(params[:query])}%",
                          "%#{User.sanitize_sql_like(params[:query])}%")
      render json: @users, each_serializer: MafundiUserSerializer, status: :ok
    end
  end

  def index
    @users = User.page(params[:page]).per(params[:per_page] || 10)
    users_json = ActiveModelSerializers::SerializableResource.new(@users, each_serializer: MafundiUserSerializer).as_json
    render json: { meta: pagination_meta(@users), user: users_json }, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, serializer: MafundiUserSerializer, status: :ok
  end
end
