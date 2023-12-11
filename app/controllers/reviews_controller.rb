class ReviewsController < ApplicationController
  include Pagination
  before_action :authenticate_user!
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_task_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_review_not_found_response

  def index
    @reviews = Review.where(handyman_id: params[:handyman_id]).page(params[:page]).per(params[:per_page] || 10)
    reviews_json = ActiveModelSerializers::SerializableResource.new(@reviews, each_serializer: ReviewSerializer).as_json

    render json: { meta: pagination_meta(@reviews), reviews: @reviews }, status: :ok
  end

  def show
    @review = Review.find(params[:id])
    render json: @review, status: :ok
  end

  def create
    @review = current_user.client.reviews.create!(review_params)
    render json: { message: "Review created successfully", review: @review }, status: :created
  end

  def update
    @review = Review.find(params[:id])
    @review.update!(review_params)
    render json: { message: "Review updated Successfully", review: @review }, status: :ok
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!
    render json: { message: "Review deleted" }, status: :no_content
  end

  private

  def review_params
    params.permit(
      :comment,
      :rating,
      :handyman_id,
    )
  end

  def render_review_not_found_response
    render json: { error: "Review not found" }, status: :not_found
  end
end
