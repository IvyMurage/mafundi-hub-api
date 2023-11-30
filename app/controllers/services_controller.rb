class ServicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
  wrap_parameters format: []
  #   before_action :authenticate_user!

  def search
    if params[:query].present?
      @services = Service.where("service_name ILIKE ?",
                                "%#{Service.sanitize_sql_like(params[:query])}%")
      render json: @services, status: :ok
    end
  end

  def index
    @services = Service.all
    render json: @services, status: :ok
  end

  def show
    @service = find_service
    render json: @service
  end

  def create
    @service = Service.create!(service_params)
    render json: @service, status: :created
  end

  def update
    @service = find_service
    @service.update!(service_params)
    render json: @service, status: :ok
  end

  def destroy
    @service = find_service
    @service.destroy
    head :no_content
  end

  private

  def service_params
    params.permit(:service_name, :service_category_id)
  end

  def find_service
    @service = Service.find(params[:id])
  end

  def render_response_not_found
    render json: { error: "Service not found" }, status: :not_found
  end
end
