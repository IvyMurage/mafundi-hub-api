class AddTaskIdAndHandymanIdToJobProposal < ActiveRecord::Migration[7.1]
  def change
    add_column :job_proposals, :task_id, :integer
    add_column :job_proposals, :handyman_id, :integer
  end
end
