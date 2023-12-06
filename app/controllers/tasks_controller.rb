class TasksController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  include Pagination

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_task_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_task_not_found
  wrap_parameters format: []

  def search
    if params[:query].present?
      @tasks = Task.where("job_title ILIKE ? OR task_description ILIKE?",
                          "%#{Task.sanitize_sql_like(params[:query])}%",
                          "%#{Task.sanitize_sql_like(params[:query])}%")
      render json: @tasks, serializer: TaskSerializer, status: :ok
    end
  end

  def index
    @tasks = Task.page(params[:page]).per(params[:per_page] || 10)
    @tasks = Task.by_location(params[:city]).page(params[:page]).per(params[:per_page] || 10) if params[:city].present?
    @tasks = Task.where(client_id: task_params[:client_id]).page(params[:page]).per(params[:per_page] || 10) if params[:client_id].present?
    @tasks = Task.by_service(params[:service_id]).page(params[:page]).per(params[:per_page] || 10) if params[:service_id].present?

    render json: { tasks: @tasks, meta: pagination_meta(@tasks) }, each_serializer: TaskSerializer, status: :ok
  end

  def show
    @task = Task.find(params[:id])
    render json: @task, serializer: TaskSerializer, status: :ok
  end

  def create
    byebug
    @task = Task.create!(task_params)
    render json: @task, serializer: TaskSerializer, status: :created
  end

  def update
    @task = Task.find(params[:id])
    @task.update!(task_params)
    render json: @task, serializer: TaskSerializer, status: :ok
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.permit(
      :job_title,
      :task_description,
      :client_id,
      :job_price,
      :service_id,
      :available,
      :instant_booking,
      :duration_label,
      task_responsibilities: [],
      location_attributes: [
        :city,
        :county,
        :country,
      ],
    )
  end

  def render_task_not_found
    render json: { error: "Task not found" }, status: :not_found
  end
end
