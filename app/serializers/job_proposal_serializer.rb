class JobProposalSerializer < ActiveModel::Serializer
  attributes :id, :task_id, :status, :proposal_text, :handyman_id
end
