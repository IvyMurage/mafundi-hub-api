class RemoveUserFromClients < ActiveRecord::Migration[7.1]
  def change
    remove_reference :clients, :user, null: false, foreign_key: true
  end
end
