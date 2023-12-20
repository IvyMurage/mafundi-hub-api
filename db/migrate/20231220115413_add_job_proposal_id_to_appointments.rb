class AddJobProposalIdToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :job_proposal, foreign_key: true, null: true
  end
end
