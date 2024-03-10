class AppointmentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  include Pagination

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  wrap_parameters format: []

  def search
    if params[:query].present?
      @appointments = Appointment.where("job_title ILIKE ? OR task_description ILIKE?",
                                        "%#{Appointment.sanitize_sql_like(params[:query])}%",
                                        "%#{Appointment.sanitize_sql_like(params[:query])}%")
      render json: @appointments, each_serializer: AppointmentSerializer, status: :ok
    end
  end

  def index
    @appointments = Appointment.page(params[:page]).per(params[:per_page] || 10)
    @appointments = @appointments.by_location(params[:city]) if params[:city].present?
    @appointments = @appointments.where(client_id: appointment_params[:client_id]) if params[:client_id].present?
    @appointments = @appointment.by_service(params[:service_id]) if params[:service_id].present?
    appointments_json = ActiveModelSerializers::SerializableResource.new(@appointments, each_serializer: AppointmentSerializer).as_json
    render json: { meta: pagination_meta(@appointments), appointment: appointments_json }, status: :ok
  end

  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment, serializer: AppointmentSerializer, status: :ok
  end

  def create
    @appointment = current_user.client.appointments.create!(appointment_params)
    render json: @appointment, serializer: AppointmentSerializer, status: :created
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update!(appointment_params)
    render json: @appointment, serializer: AppointmentSerializer, status: :ok
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(
      :job_proposal_id,
      :handyman_id,
      :task_id,
      :appointment_notes,
      :duration,
      :client_id,
      :appointment_date,
      :appointment_time,
      :appointment_status,
    )
  end
end
