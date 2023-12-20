class JobProposal < ApplicationRecord
  has_one :appointment
  belongs_to :handyman
  belongs_to :task
  validates :job_status, inclusion: { in: %w[proposed accepted declined] }
  validates :proposal_text, presence: true
  validates :handyman, presence: true
  validates :task, presence: true
  validates :job_status, presence: true
  validates :proposal_text, presence: true
end
