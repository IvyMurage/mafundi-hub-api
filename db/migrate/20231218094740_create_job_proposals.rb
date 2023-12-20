class CreateJobProposals < ActiveRecord::Migration[7.1]
  def change
    create_table :job_proposals do |t|
      t.references :task
      t.string :job_status, default: "inprogress"
      t.text :proposal_text
      t.references :handyman
      t.timestamps
    end
  end
end
