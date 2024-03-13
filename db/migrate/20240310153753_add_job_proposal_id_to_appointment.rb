class AddJobProposalIdToAppointment < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :job_proposal_id, :integer
  end
end
