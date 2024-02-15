class RemoveTaskIdAndHandymanIdFromJobProposal < ActiveRecord::Migration[7.1]
  def change
    remove_column :job_proposals, :task_id, :bigint
    remove_column :job_proposals, :handyman_id, :bigint
  end
end
