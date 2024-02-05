class AddClientIdToTask < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :client_id, :integer
  end
end
