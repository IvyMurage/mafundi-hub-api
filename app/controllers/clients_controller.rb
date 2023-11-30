class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
  wrap_parameters format: []
  #   before_action :authenticate_user!

  def search
    if params[:query].present?
      @clients = Client.where("first_name ILIKE ? OR last_name ILIKE ?",
                              "%#{Client.sanitize_sql_like(params[:query])}%",
                              "%#{Client.sanitize_sql_like(params[:query])}%")
      render json: @clients, status: :ok
    end
  end

  def index
    @clients = Client.all
    render json: @clients, status: :ok
  end

  def show
    @client = find_client
    render json: @client
  end

  def create
    @client = Client.create!(client_params)

    render json: @client, status: :created
  end

  def update
    @client = find_client
    @client.update!(client_params)
    render json: @client, status: :ok
  end

  def destroy
    @client = find_client
    @client.destroy
    head :no_content
  end

  private

  def client_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      location_attributes: [
        :county, :city, :country,
      ],
    )
  end

  def find_client
    @client = Client.find(params[:id])
  end

  def render_response_not_found
    render json: { error: "Client not found" }, status: :not_found
  end
end
