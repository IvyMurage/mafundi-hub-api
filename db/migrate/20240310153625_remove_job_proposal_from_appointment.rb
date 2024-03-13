class RemoveJobProposalFromAppointment < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :job_proposal_id, :bigint
  end
end
