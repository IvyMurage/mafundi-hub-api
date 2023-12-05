class AddDurationLabelToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :duration_label, :string
  end
end
