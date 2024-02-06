class ServiceCategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
  wrap_parameters format: []
  # before_action :authenticate_user!

  def search
    if params[:query].present?
      @service_categories = ServiceCategory.where("category_name ILIKE ?",
                                                  "%#{ServiceCategory.sanitize_sql_like(params[:query])}%")
      byebug
      render json: @service_categories, status: :ok
    end
  end

  def index
    @service_categories = ServiceCategory.all
    render json: @service_categories, status: :ok
  end

  def show
    @service_category = ServiceCategory.find(params[:id])
    render json: @service_category
  end

  def create
    @service_category = ServiceCategory.create!(service_category_params)
    render json: @service_category, status: :created
  end

  def update
    @service_category = find_service_category
    @service_category.update!(service_category_params)
    render json: @service_category, status: :ok
  end

  def destroy
    @service_category = find_service_category
    @service_category.destroy
    head :no_content
  end

  private

  def service_category_params
    params.permit(:category_name)
  end

  def find_service_category
    @service_category = ServiceCategory.find(params[:id])
  end

  def render_response_not_found
    render json: { error: "Service Category not found" }, status: :not_found
  end
end
