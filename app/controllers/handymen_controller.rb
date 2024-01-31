class HandymenController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  wrap_parameters format: []
  include Pagination

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_handyman_not_found

  def search
    @handymen = Handyman.search_by_query(params[:query])
    render json: { handymen: @handymen }, status: :ok
  end

  def index
    @handymen = Handyman.page(params[:page]).per(params[:per_page] || 10)

    @handymen = @handymen.by_location(params[:city]) if params[:city].present?
    @handymen = @handymen.where(service_id: params[:service_id]) if params[:service_id].present?

    @handymen_json = ActiveModelSerializers::SerializableResource.new(@handymen, each_serializer: HandymanSerializer).as_json
    render json: { meta: pagination_meta(@handymen), handymen: @handymen_json }, status: :ok
  end

  def show
    @handyman = Handyman.find(params[:id])
    render json: @handyman, serialize: HandymanSerializer, status: :ok
  end

  def create
    @handyman = Handyman.create!(handyman_params)
    render json: { message: "Profile created successfully", handyman: HandymanSerializer.new(@handyman) }, status: :created
  end

  def update
    @handyman = Handyman.find(params[:id])
    if params[:location_attributes].present?
      location_attributes = params.require(:location_attributes).permit(:county, :city, :country)
      @handyman.location.update!(location_attributes)
    end

    @handyman.update!(handyman_params)
    render json: { message: "Handyman updated Successfully", handyman: HandymanSerializer.new(@handyman) }, status: :ok
  end

  def destroy
    @handyman = Handyman.find(params[:id])
    @handyman.destroy!
    render json: { message: "Handyman deleted", handyman: @handyman }, status: :no_content
  end

  private

  def handyman_params
    params.permit(:first_name,
                  :last_name,
                  :title,
                  :description,
                  :phone_number,
                  :user_id,
                  :service_id,
                  :media_url,
                  :year_of_experience,
                  :availability,
                  handyman_skills: [],
                  location_attributes: [:city, :county, :country])
  end

  def render_handyman_not_found
    render json: { error: "Handyman not found" }, status: :not_found
  end
end
