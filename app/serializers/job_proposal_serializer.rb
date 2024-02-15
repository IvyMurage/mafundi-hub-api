class JobProposalSerializer < ActiveModel::Serializer
  attributes :id, :job_status, :proposal_text
  has_one :handyman
  belongs_to :task
end
