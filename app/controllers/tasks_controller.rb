class TasksController < ApplicationController
  load_and_authorize_resource

  def index
    @tasks = Task.all
    render json: @tasks, status: :ok
  end
end
