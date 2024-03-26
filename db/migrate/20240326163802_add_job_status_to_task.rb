class AddJobStatusToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :job_status, :string, default: "pending"
  end
end
