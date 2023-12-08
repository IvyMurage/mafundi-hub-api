class RemoveTaskIdFromReview < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :task_id, :integer
  end
end
