class JobProposalSerializer < ActiveModel::Serializer
  attributes :id, :job_status, :proposal_text
  has_one :handyman
end
