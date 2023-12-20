class JobProposalSerializer < ActiveModel::Serializer
  attributes :id, :task_id, :job_status, :proposal_text, :handyman_id
end
