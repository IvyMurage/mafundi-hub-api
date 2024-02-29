class JobProposalSerializer < ActiveModel::Serializer
  attributes :id, :job_status, :proposal_text, :task_title, :handyman_id

  def task_title
    object.task.job_title
  end

  def handyman_id
    object.handyman.id
  end
end
