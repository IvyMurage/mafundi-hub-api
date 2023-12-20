class JobProposalsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  include Pagination

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_job_proposal_not_found

  wrap_parameters format: []

  def search
    if params[:query].present?
      @job_proposals = JobProposal.where("job_title ILIKE ? OR task_description ILIKE?",
                                         "%#{JobProposal.sanitize_sql_like(params[:query])}%",
                                         "%#{JobProposal.sanitize_sql_like(params[:query])}%")
      render json: @job_proposals, each_serializer: JobProposalSerializer, status: :ok
    end
  end

  def index
    @job_proposals = @job_proposals.by_location(params[:city]) if params[:city].present?
    @job_proposals = @job_proposal.by_service(params[:service_id]) if params[:service_id].present?
    job_proposals_json = ActiveModelSerializers::SerializableResource.new(@job_proposals, each_serializer: JobProposalSerializer).as_json
    render json: { meta: pagination_meta(@job_proposals), job_proposal: job_proposals_json }, status: :ok
  end

  def show
    @job_proposal = JobProposal.find(params[:id])
    render json: @job_proposal, serializer: JobProposalSerializer, status: :ok
  end

  def create
    byebug
    @job_proposal = JobProposal.create!(job_proposal_params)
    render json: @job_proposal, serializer: JobProposalSerializer, status: :created
  end

  def update
    @job_proposal = JobProposal.find(params[:id])
    @job_proposal.update!(job_proposal_params)
    render json: @job_proposal, serializer: JobProposalSerializer, status: :ok
  end

  def destroy
    @job_proposal = JobProposal.find(params[:id])
    @job_proposal.destroy
    head :no_content
  end

  private

  def job_proposals_json
    ActiveModelSerializers::SerializableResource.new(@job_proposals, each_serializer: JobProposalSerializer).as_json
  end

  def job_proposal_params
    params.permit(
      :job_title,
      :task_description,
      :client_id,
      :job_price,
      :service_id,
      :handyman_id,
      :appointment_id,
      :job_status,
      :proposal_text
    )
  end
end
