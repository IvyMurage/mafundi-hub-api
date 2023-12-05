class AddTaskResponsibilitiesToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :task_responsibilities, :text
  end
end
