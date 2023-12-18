class CreateJobProposals < ActiveRecord::Migration[7.1]
  def change
    create_table :job_proposals do |t|
      t.integer :task_id
      t.string :status
      t.text :proposal_text
      t.integer :handyman_id

      t.timestamps
    end
  end
end
