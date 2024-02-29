class JobProposalSerializer < ActiveModel::Serializer
  attributes :id, :job_status, :proposal_text, :task_title
  has_one :handyman

  def task_title
    object.task.job_title
  end
end
