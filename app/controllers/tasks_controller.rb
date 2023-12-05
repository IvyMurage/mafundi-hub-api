class TasksController < ApplicationController
  load_and_authorize_resource

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
    if task_params[:client_id]
      @tasks = Task.where(client_id: task_params[:client_id])
    else
      @tasks = Task.all
    end
    render json: @tasks, serializer: TaskSerializer, status: :ok
  end

  def show
    @task = Task.find(params[:id])
    render json: @task, serializer: TaskSerializer, status: :ok
  end

  def create
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
    params.require(:task).permit(
      :job_title,
      :task_description,
      :client_id,
      :job_price,
      :service_id,
      :available,
      :instant_booking,
      location_attributes: [
        :city,
        :county,
        :country,
      ],
    )
  end

  def render_unprocessable_task_entity(invalid)
    render json: invalid.record.errors.full_messages, status: :unprocessable_entity
  end

  def render_task_not_found
    render json: { error: "Task not found" }, status: :not_found
  end
end
