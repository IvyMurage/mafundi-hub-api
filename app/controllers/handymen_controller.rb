class HandymenController < ApplicationController
  def search
    @handymen = Handyman.search_by_query(params[:query])
    render json: { handymen: @handymen }, status: :ok
  end

  def index
    @handymen = Handyman.by_location(params[:city]) if params[:city].present?
    @handymen = Handymen.where(service_id: params[:service_id]) if params[:service_id].present?

    @handymen = Handyman.all
    render json: { handymen: @handymen }, status: :ok
  end

  def show
    @handyman = Handyman.find(params[:id])
    render json: { handyman: @handyman }, status: :ok
  end

  def create
    @handyman = Handyman.create!(handyman_params)
    render json: { message: "Profile created successfully", handyman: @handyman }, status: :created
  end

  def update
    @handyman = Handyman.find(params[:id])
    @handyman.update!(handyman_params)
    render json: { message: "Handyman updated Successfully", handyman: @handyman }, status: :ok
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
                  :year_of_experience,
                  :availability,
                  handyman_skills: [],
                  location_attributes: [:city, :county, :country])
  end

  def render_handyman_not_found
  end
end
