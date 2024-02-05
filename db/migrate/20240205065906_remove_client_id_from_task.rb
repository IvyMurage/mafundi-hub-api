class RemoveClientIdFromTask < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :client_id, :bigint
  end
end
